module TestRail
  class Client
    # Methods for the Suites API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-suites
    # Use the following API methods to request details about test suites and to create or modify test suites.

    #
    # Returns an existing test suite.
    #
    # :suite_id	The ID of the test suite
    #
    def suite(suite_id)
      get("get_suite/#{suite_id}")
    end

    def suite_by_name(project_id, suite_name, ignore_case = true)
      if ignore_case
        suites(project_id).find { |suite| suite['name'].casecmp(suite_name) == 0 }
      else
        suites(project_id).find { |suite| suite['name'] == suite_name }
      end
    end

    #
    # Returns a list of test suites for a project.
    #
    # :project_id	The ID of the project
    #
    def suites(project_id)
      get("get_suites/#{project_id}")
    end

    #
    # Creates a new test suite.
    #
    # :project_id	The ID of the project the test suite should be added to
    #
    def add_suite(project_id, data)
      post("add_suite/#{project_id}", data)
    end
  end
end
