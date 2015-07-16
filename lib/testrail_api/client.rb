require 'testrail_api/endpoints'
require 'testrail_api/version'

require 'typhoeus'
require 'json'

module TestRail
  class Client
    attr_accessor :server
    attr_accessor :username, :password
    attr_accessor :verbose

    # @param server [String] TestRail server host
    # @param email [String] TestRail email
    # @param password [String] TestRail password or API key
    # @param opts [Hash] Optional parameters
    # @option opts [Boolean] :verbose Print libcurl debug output to the console (STDERR) if true (default : false)
    # @option opts [Boolean] :secure Use HTTPS if true (default: true)
    def initialize(server, email, password, opts = {})
      # required
      @server                  = server
      @username                = email
      @password                = password

      # optional
      @verbose                 = opts.fetch(:verbose, false)
      @secure                  = opts.fetch(:secure, true)
      Typhoeus::Config.verbose = verbose
    end

    def scheme
      @scheme ||= @secure ? 'https' : 'http'
    end

    def api_endpoint
      @api_endpoint ||= File.join("#{scheme}://#{@server}", 'index.php?api/v2')
    end

    def user_agent
      @user_agent ||= "TestRail API v2 Gem #{VERSION}"
    end

    def default_headers
      @default_headers ||= {
          'Accept'       => 'application/json',
          'Content-Type' => 'application/json',
          'User-Agent'   => user_agent
      }
    end

    def get(path, opts = {})
      request(:get, path, opts)
    end

    def post(path, opts = {})
      request(:post, path, opts)
    end

    def request(method, path, opts = {})
      body = Typhoeus::Request.new(
          File.join(api_endpoint, path),
          { method:  method,
            headers: default_headers,
            userpwd: "#{@username}:#{@password}" }.merge(opts)
      ).run.body
      JSON.parse(body)
    rescue JSON::ParserError
      body
    end
  end
end
