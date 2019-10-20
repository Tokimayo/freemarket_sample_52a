##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'PublishedTrack' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                      .participants('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                      .published_tracks('MTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks/MTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "participant_sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": "bob-track",
          "kind": "data",
          "enabled": true,
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks/MTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                             .participants('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                             .published_tracks('MTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms('RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                      .participants('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                      .published_tracks.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "published_tracks": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "published_tracks"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms('RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                             .participants('PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                             .published_tracks.list()

    expect(actual).to_not eq(nil)
  end
end