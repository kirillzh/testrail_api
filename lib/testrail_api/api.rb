require 'core_ext/to_list'

require 'testrail_api/client/case_fields'
require 'testrail_api/client/case_types'
require 'testrail_api/client/cases'
require 'testrail_api/client/milestones'
require 'testrail_api/client/plans'
require 'testrail_api/client/priorities'
require 'testrail_api/client/projects'
require 'testrail_api/client/result_fields'
require 'testrail_api/client/results'
require 'testrail_api/client/runs'
require 'testrail_api/client/sections'
require 'testrail_api/client/statuses'
require 'testrail_api/client/suites'
require 'testrail_api/client/tests'
require 'testrail_api/client/users'

module TestRail
  class Client
    module API
      include TestRail::Client::CaseFields
      include TestRail::Client::CaseTypes
      include TestRail::Client::Cases
      include TestRail::Client::Milestones
      include TestRail::Client::Plans
      include TestRail::Client::Priorities
      include TestRail::Client::Projects
      include TestRail::Client::ResultFields
      include TestRail::Client::Results
      include TestRail::Client::Runs
      include TestRail::Client::Sections
      include TestRail::Client::Statuses
      include TestRail::Client::Suites
      include TestRail::Client::Tests
      include TestRail::Client::Users
    end
  end
end
