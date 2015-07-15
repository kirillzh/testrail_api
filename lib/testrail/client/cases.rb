module TestRail
  class Client
    # Methods for the Cases API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-cases
    #
    # Returns an existing test case
    #
    # @param [Integer, String] case_id  The ID of the test case
    # @return an existing test case
    # @see http://docs.gurock.com/testrail-api2/reference-cases#get_case
    def case(case_id)
      get("get_case/#{case_id}")
    end

    #
    # Returns a list of test cases for a test suite or specific section in a test suite.
    #
    # @param [Integer, String] project_id  The ID of the project the test run should be added to
    # @param [Integer, String] suite_id  The ID of the test suite (optional if the project is operating in single suite mode)
    # @param [Integer, String] section_id  The ID of the section (optional)
    # @param filters [Hash]: A customizable set of filters
    # @option filters [Integer] :created_after Only return test cases created after this date (as UNIX timestamp).
    # @option filters [Integer] :created_before Only return test cases created before this date (as UNIX timestamp).
    # @option filters [Array<Integer>] :created_by A comma-separated list of creators (user IDs) to filter by.
    # @option filters [Array<Integer>] :milestone_id A comma-separated list of milestone IDs to filter by (not available if the milestone field is disabled for the project).
    # @option filters [Array<Integer>] :priority_id A comma-separated list of priority IDs to filter by.
    # @option filters [Array<Integer>] :type_id A comma-separated list of case type IDs to filter by.
    # @option filters [Integer] :updated_after Only return test cases updated after this date (as UNIX timestamp).
    # @option filters [Integer] :updated_before Only return test cases updated before this date (as UNIX timestamp).
    # @option filters [Array<Integer>] :updated_by A comma-separated list of users who updated test cases to filter by.
    # @return a list of test cases for a test suite or specific section in a test suite. The response includes an array of test cases. Each test case in this list follows the same format as TestRail#Client#get_case
    # @see http://docs.gurock.com/testrail-api2/reference-cases#get_cases
    def cases(project_id, suite_id, section_id = '', filters = {})
      get("get_cases/#{project_id}&suite_id=#{suite_id}&section_id=#{section_id}", filters)
    end

    #
    # Creates a new test case.
    #
    # @param [Integer, String] section_id  The ID of the section the test case should be added to
    # @param payload [Hash]: A customizable payload
    # @option payload [String] :title The title of the test case (required)
    # @option payload [Integer] :type_id The ID of the case type
    # @option payload [Integer] :priority_id The ID of the case priority
    # @option payload [String] :estimate The estimate, e.g. "30s" or "1m 45s"
    # @option payload [Integer] :milestone_id The ID of the milestone to link to the test case
    # @option payload [String] :refs A comma-separated list of references/requirements
    # TODO: finish docs
    # @return
    # @see http://docs.gurock.com/testrail-api2/reference-cases#add_case
    def add_case(section_id, payload)
      post("get_case/#{section_id}", payload)
    end

    #
    # Returns an existing test case by its name.
    # :case_name  The ID of the test case if number provided
    #
    def case_by_name(_case_name)
      # TODO: implement get_case_by_name
    end

    # Custom method
    # TODO: finish docs
    def cases_ids(project_id, suite_id, section_id = '')
      cases(project_id, suite_id, section_id).map { |x| x['id'] }
    end

    def update_case(_case_id, _payload)
      # TODO: finish
    end

    def delete_case(_case_id)
      # TODO: finish
    end
  end
end
