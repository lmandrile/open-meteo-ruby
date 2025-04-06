module OpenMeteo
  class Client
    ##
    # The class that constructs the URLs for given endpoints.
    class UrlBuilder
      API_PATHS = {
        forecast: "v1/forecast",
        forecast_dwd_icon: "v1/dwd-icon",
        search: "v1/search",
      }.freeze

      attr_reader :config

      def initialize(config: OpenMeteo::Client::Config.new)
        @config = config
      end

      def build_url(endpoint, path_params = {})
        relative_path = API_PATHS.fetch(endpoint.to_sym)
        full_path = [config.url, relative_path].join("/")

        URI::DEFAULT_PARSER.escape(format(full_path, path_params))
      end
    end
  end
end
