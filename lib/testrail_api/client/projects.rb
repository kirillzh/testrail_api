module TestRail
  class Client
    # Methods for the Projects API
    #
    # @see http://docs.gurock.com/testrail-api2/reference-projects
    #
    # Returns the list of available projects.
    #
    def projects
      get('get_projects')
    end

    #
    # Returns an existing project by its ID.
    #
    # :project_id  The ID of the project
    #
    def project(project_id)
      get("get_project/#{project_id}")
    end

    #
    # Returns an existing project by its name.
    #
    # :project_name  The name of the project
    #
    def project_by_name(project_name, ignore_case = true)
      if ignore_case
        projects.find { |project| project['name'].casecmp(project_name) == 0 }
      else
        projects.find { |project| project['name'] == project_name }
      end
    end
  end
end
