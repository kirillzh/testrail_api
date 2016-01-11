require 'testrail_api/api'
require 'testrail_api/default'

require 'typhoeus'
require 'json'

module TestRail
  class Client
    include TestRail::Client::API

    attr_reader :server, :email, :password

    # @param server [String] TestRail server host
    # @param email [String] TestRail email
    # @param password [String] TestRail password or API key
    # @option [Boolean] :secure   Use HTTPS if true (default: true)
    # @option [Boolean] :verbose  Print libcurl debug output to the console (STDERR) if true (default : false)
    def initialize(server, email, password, secure: true, verbose: false)
      # required
      @server      = server
      @email       = email
      @password    = password

      # optional
      @secure      = secure
      self.verbose = verbose
    end

    def verbose=(bool)
      Typhoeus::Config.verbose = bool
    end

    def verbose
      Typhoeus::Config.verbose
    end

    def scheme
      @scheme ||= @secure ? 'https' : 'http'
    end

    def api_endpoint
      @api_endpoint ||= File.join("#{scheme}://#{@server}", 'index.php?api/v2')
    end

    def user_agent
      @user_agent ||= "TestRail API v2 Gem #{TestRail::VERSION}"
    end

    def get(path, opts = {})
      request(:get, path, opts)
    end

    def post(path, opts = {})
      request(:post, path, opts)
    end

    def credentials
      "#{@email}:#{@password}"
    end

    def request(method, path, opts = {})
      body = Typhoeus::Request.new(
          File.join(api_endpoint, path),
          { method:  method,
            headers: Default::HEADERS,
            userpwd: credentials
          }.merge(opts)
      ).run.body
      JSON.parse(body)
    rescue JSON::ParserError
      body
    end
  end
end
