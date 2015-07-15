module TestRail
  class Client
    # Methods for the Case Types API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-cases-types
    def case_types
      get('get_case_types')
    end
  end
end
