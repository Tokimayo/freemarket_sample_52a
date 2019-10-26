##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Application' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .applications.create(friendly_name: 'friendly_name')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'FriendlyName' => 'friendly_name', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
          "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
          "friendly_name": "Application Friendly Name",
          "message_status_callback": "http://www.example.com/sms-status-callback",
          "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_fallback_method": "GET",
          "sms_fallback_url": "http://www.example.com/sms-fallback",
          "sms_method": "GET",
          "sms_status_callback": "http://www.example.com/sms-status-callback",
          "sms_url": "http://example.com",
          "status_callback": "http://example.com",
          "status_callback_method": "GET",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "GET",
          "voice_fallback_url": "http://www.example.com/voice-callback",
          "voice_method": "GET",
          "voice_url": "http://example.com"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications.create(friendly_name: 'friendly_name')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
          "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
          "friendly_name": "Application Friendly Name",
          "message_status_callback": "http://www.example.com/sms-status-callback",
          "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_fallback_method": "GET",
          "sms_fallback_url": "http://www.example.com/sms-fallback",
          "sms_method": "GET",
          "sms_status_callback": "http://www.example.com/sms-status-callback",
          "sms_url": "http://example.com",
          "status_callback": "http://example.com",
          "status_callback_method": "GET",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "GET",
          "voice_fallback_url": "http://www.example.com/voice-callback",
          "voice_method": "GET",
          "voice_url": "http://example.com"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .applications.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "applications": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "api_version": "2010-04-01",
                  "date_created": "Fri, 21 Aug 2015 00:07:25 +0000",
                  "date_updated": "Fri, 21 Aug 2015 00:07:25 +0000",
                  "friendly_name": "d8821fb7-4d01-48b2-bdc5-34e46252b90b",
                  "message_status_callback": null,
                  "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sms_fallback_method": "POST",
                  "sms_fallback_url": null,
                  "sms_method": "POST",
                  "sms_status_callback": null,
                  "sms_url": null,
                  "status_callback": null,
                  "status_callback_method": "POST",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
                  "voice_caller_id_lookup": false,
                  "voice_fallback_method": "POST",
                  "voice_fallback_url": null,
                  "voice_method": "POST",
                  "voice_url": null
              }
          ],
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=35",
          "next_page_uri": null,
          "num_pages": 36,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 36,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "applications": [],
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0",
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=35",
          "next_page_uri": null,
          "num_pages": 36,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 36,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications.json?PageSize=1&Page=0"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "date_created": "Mon, 22 Aug 2011 20:59:45 +0000",
          "date_updated": "Tue, 18 Aug 2015 16:48:57 +0000",
          "friendly_name": "Application Friendly Name",
          "message_status_callback": "http://www.example.com/sms-status-callback",
          "sid": "APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_fallback_method": "GET",
          "sms_fallback_url": "http://www.example.com/sms-fallback",
          "sms_method": "GET",
          "sms_status_callback": "http://www.example.com/sms-status-callback",
          "sms_url": "http://example.com",
          "status_callback": "http://example.com",
          "status_callback_method": "GET",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Applications/APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "GET",
          "voice_fallback_url": "http://www.example.com/voice-callback",
          "voice_method": "GET",
          "voice_url": "http://example.com"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .applications('APaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()

    expect(actual).to_not eq(nil)
  end
end