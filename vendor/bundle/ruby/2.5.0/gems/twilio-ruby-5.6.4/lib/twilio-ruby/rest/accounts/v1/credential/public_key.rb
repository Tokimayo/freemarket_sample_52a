##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Accounts < Domain
      class V1 < Version
        class CredentialList < ListResource
          class PublicKeyList < ListResource
            ##
            # Initialize the PublicKeyList
            # @param [Version] version Version that contains the resource
            # @return [PublicKeyList] PublicKeyList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
              @uri = "/Credentials/PublicKeys"
            end

            ##
            # Lists PublicKeyInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams PublicKeyInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields PublicKeyInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of PublicKeyInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of PublicKeyInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              PublicKeyPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PublicKeyInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of PublicKeyInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              PublicKeyPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of PublicKeyInstance records from the API.
            # Request is executed immediately.
            # @param [String] public_key URL encoded representation of the public key, e.g.
            #   -----BEGIN PUBLIC KEY-----MIIBIjANB.pa9xQIDAQAB-----END PUBLIC KEY-----
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @param [String] account_sid The Subaccount this Credential should be associated
            #   with. Needs to be a valid Subaccount of the account issuing the request
            # @return [PublicKeyInstance] Newly created PublicKeyInstance
            def create(public_key: nil, friendly_name: :unset, account_sid: :unset)
              data = Twilio::Values.of({
                  'PublicKey' => public_key,
                  'FriendlyName' => friendly_name,
                  'AccountSid' => account_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              PublicKeyInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Accounts.V1.PublicKeyList>'
            end
          end

          class PublicKeyPage < Page
            ##
            # Initialize the PublicKeyPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [PublicKeyPage] PublicKeyPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of PublicKeyInstance
            # @param [Hash] payload Payload response from the API
            # @return [PublicKeyInstance] PublicKeyInstance
            def get_instance(payload)
              PublicKeyInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Accounts.V1.PublicKeyPage>'
            end
          end

          class PublicKeyContext < InstanceContext
            ##
            # Initialize the PublicKeyContext
            # @param [Version] version Version that contains the resource
            # @param [String] sid The Credential Sid that uniquely identifies the Credential
            #   to fetch
            # @return [PublicKeyContext] PublicKeyContext
            def initialize(version, sid)
              super(version)

              # Path Solution
              @solution = {sid: sid, }
              @uri = "/Credentials/PublicKeys/#{@solution[:sid]}"
            end

            ##
            # Fetch a PublicKeyInstance
            # @return [PublicKeyInstance] Fetched PublicKeyInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              PublicKeyInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Update the PublicKeyInstance
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @return [PublicKeyInstance] Updated PublicKeyInstance
            def update(friendly_name: :unset)
              data = Twilio::Values.of({'FriendlyName' => friendly_name, })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              PublicKeyInstance.new(@version, payload, sid: @solution[:sid], )
            end

            ##
            # Deletes the PublicKeyInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Accounts.V1.PublicKeyContext #{context}>"
            end
          end

          class PublicKeyInstance < InstanceResource
            ##
            # Initialize the PublicKeyInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] sid The Credential Sid that uniquely identifies the Credential
            #   to fetch
            # @return [PublicKeyInstance] PublicKeyInstance
            def initialize(version, payload, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [PublicKeyContext] PublicKeyContext for this PublicKeyInstance
            def context
              unless @instance_context
                @instance_context = PublicKeyContext.new(@version, @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] AccountSid the Credential resource belongs to
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] A human readable description of this resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [Time] The date this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URI for this resource, relative to `https://accounts.twilio.com`
            def url
              @properties['url']
            end

            ##
            # Fetch a PublicKeyInstance
            # @return [PublicKeyInstance] Fetched PublicKeyInstance
            def fetch
              context.fetch
            end

            ##
            # Update the PublicKeyInstance
            # @param [String] friendly_name A human readable description of this resource, up
            #   to 64 characters.
            # @return [PublicKeyInstance] Updated PublicKeyInstance
            def update(friendly_name: :unset)
              context.update(friendly_name: friendly_name, )
            end

            ##
            # Deletes the PublicKeyInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Accounts.V1.PublicKeyInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Accounts.V1.PublicKeyInstance #{values}>"
            end
          end
        end
      end
    end
  end
end