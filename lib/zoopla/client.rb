module RZoopla
  module Client
    class << self
      BASE_URI = 'http://api.zoopla.co.uk/api/v1/'

      def get(end_point, options = {})
        options = { api_key: RZoopla.configuration.api_key }.merge(options)
        uri = URI.parse([BASE_URI, end_point, '.json', parse_params(options)].join)
        response = Net::HTTP.get_response(uri)
        if response.code == '200'
          JSON.parse(response.body)
        else
          fail "#{response.message} (#{response.code})"
        end
      end

      private

      def parse_params(params)
        return '' if params.empty?
        '?' + params.map { |k, v|
          "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"
        }.join('&')
      end
    end
  end
end
