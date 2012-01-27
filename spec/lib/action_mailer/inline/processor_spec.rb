require "spec_helper"

describe ActionMailer::Inline::Processor do

  before do
    ActionMailer::Inline.stub(:delivering_email).and_return(message)
  end

  let(:message) { NotificationMailer.welcome_html_email.deliver }
  let(:processor) { ActionMailer::Inline::Processor.new(message) }

  describe :message do
    it "should have a html part" do
      message.html_part.should_not be_nil
    end
  end

  it "should initialize with a message object" do
    processor.message.should == message
  end

  it "should reset message body so we can replace it with the processed body" do
    processor.message.should_receive(:body=).with(nil).once
    processor.reset_message_body!
  end

  it "captures original html part" do
    processor.original_message_parts[:html_part].should be_a Mail::Part
  end

  it "captures original text part" do
    processor.original_message_parts[:text_part].should be_a String
  end

  it "captures original attachments" do
    processor.original_message_parts[:attachments].should be_empty
  end

  it "captures message charset" do
    processor.original_message_parts[:charset].should == 'UTF-8'
  end

  describe 'message' do
    it 'should have two parts' do
      message.parts.size.should == 2
    end
  end

  describe 'html part' do
    def parse_html_to_doc(html)
      Nokogiri::HTML(html)
    end

    it 'should have a html part' do
      processor.html_part.should be_a Mail::Part
      processor.html_part.body.should_not be_nil
    end

    it 'should include asset path for stylesheet in header' do
      processor.html_part.body.should match /\<link(.+)href\=\"\/assets\/notification_mailer\.css\"(.+)\>/
    end

    it 'should have inlined css version without stylesheet links' do
      processor.premailer.to_inline_css.should_not match /\<link(.+)href\=\"\/assets\/notification_mailer\.css\"(.+)\>/
    end

    it 'replaces html body with inlined css version' do
      processor.inline!
      processor.html_part.body.should_not be_nil
      parse_html_to_doc(processor.premailer.to_inline_css).css('body')[0].attributes['style'].to_s.should == "font-family: 'Helvetica Neue', Helvetica, Ariel, sans-serif; font-size: 13px; color: #4d4d4d;"
    end
  end
end
