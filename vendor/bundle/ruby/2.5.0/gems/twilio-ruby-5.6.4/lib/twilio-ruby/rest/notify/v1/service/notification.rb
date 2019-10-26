##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class NotificationList < ListResource
            ##
            # Initialize the NotificationList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [NotificationList] NotificationList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Notifications"
            end

            ##
            # Retrieve a single page of NotificationInstance records from the API.
            # Request is executed immediately.
            # @param [String] body The body
            # @param [notification.Priority] priority The priority
            # @param [String] ttl The ttl
            # @param [String] title The title
            # @param [String] sound The sound
            # @param [String] action The action
            # @param [Hash] data The data
            # @param [Hash] apn The apn
            # @param [Hash] gcm The gcm
            # @param [Hash] sms The sms
            # @param [Hash] facebook_messenger The facebook_messenger
            # @param [Hash] fcm The fcm
            # @param [String] segment The segment
            # @param [Hash] alexa The alexa
            # @param [String] to_binding The to_binding
            # @param [String] identity The identity
            # @param [String] tag The tag
            # @return [NotificationInstance] Newly created NotificationInstance
            def create(body: :unset, priority: :unset, ttl: :unset, title: :unset, sound: :unset, action: :unset, data: :unset, apn: :unset, gcm: :unset, sms: :unset, facebook_messenger: :unset, fcm: :unset, segment: :unset, alexa: :unset, to_binding: :unset, identity: :unset, tag: :unset)
              data = Twilio::Values.of({
                  'Identity' => Twilio.serialize_list(identity) { |e| e },
                  'Tag' => Twilio.serialize_list(tag) { |e| e },
                  'Body' => body,
                  'Priority' => priority,
                  'Ttl' => ttl,
                  'Title' => title,
                  'Sound' => sound,
                  'Action' => action,
                  'Data' => Twilio.serialize_object(data),
                  'Apn' => Twilio.serialize_object(apn),
                  'Gcm' => Twilio.serialize_object(gcm),
                  'Sms' => Twilio.serialize_object(sms),
                  'FacebookMessenger' => Twilio.serialize_object(facebook_messenger),
                  'Fcm' => Twilio.serialize_object(fcm),
                  'Segment' => Twilio.serialize_list(segment) { |e| e },
                  'Alexa' => Twilio.serialize_object(alexa),
                  'ToBinding' => Twilio.serialize_list(to_binding) { |e| e },
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              NotificationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Notify.V1.NotificationList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class NotificationPage < Page
            ##
            # Initialize the NotificationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [NotificationPage] NotificationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of NotificationInstance
            # @param [Hash] payload Payload response from the API
            # @return [NotificationInstance] NotificationInstance
            def get_instance(payload)
              NotificationInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Notify.V1.NotificationPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class NotificationInstance < InstanceResource
            ##
            # Initialize the NotificationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @return [NotificationInstance] NotificationInstance
            def initialize(version, payload, service_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'identities' => payload['identities'],
                  'tags' => payload['tags'],
                  'segments' => payload['segments'],
                  'priority' => payload['priority'],
                  'ttl' => payload['ttl'].to_i,
                  'title' => payload['title'],
                  'body' => payload['body'],
                  'sound' => payload['sound'],
                  'action' => payload['action'],
                  'data' => payload['data'],
                  'apn' => payload['apn'],
                  'gcm' => payload['gcm'],
                  'fcm' => payload['fcm'],
                  'sms' => payload['sms'],
                  'facebook_messenger' => payload['facebook_messenger'],
                  'alexa' => payload['alexa'],
              }
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [String] The identities
            def identities
              @properties['identities']
            end

            ##
            # @return [String] The tags
            def tags
              @properties['tags']
            end

            ##
            # @return [String] The segments
            def segments
              @properties['segments']
            end

            ##
            # @return [notification.Priority] The priority
            def priority
              @properties['priority']
            end

            ##
            # @return [String] The ttl
            def ttl
              @properties['ttl']
            end

            ##
            # @return [String] The title
            def title
              @properties['title']
            end

            ##
            # @return [String] The body
            def body
              @properties['body']
            end

            ##
            # @return [String] The sound
            def sound
              @properties['sound']
            end

            ##
            # @return [String] The action
            def action
              @properties['action']
            end

            ##
            # @return [Hash] The data
            def data
              @properties['data']
            end

            ##
            # @return [Hash] The apn
            def apn
              @properties['apn']
            end

            ##
            # @return [Hash] The gcm
            def gcm
              @properties['gcm']
            end

            ##
            # @return [Hash] The fcm
            def fcm
              @properties['fcm']
            end

            ##
            # @return [Hash] The sms
            def sms
              @properties['sms']
            end

            ##
            # @return [Hash] The facebook_messenger
            def facebook_messenger
              @properties['facebook_messenger']
            end

            ##
            # @return [Hash] The alexa
            def alexa
              @properties['alexa']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Notify.V1.NotificationInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Notify.V1.NotificationInstance>"
            end
          end
        end
      end
    end
  end
end