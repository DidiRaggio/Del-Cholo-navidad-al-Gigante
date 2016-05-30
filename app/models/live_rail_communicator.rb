class LiveRailCommunicator < ActiveRecord::Base
 def self.get_report(live_rail_query)
 
    LiverailsApi.instance.login
    LiverailsApi.instance.statistics_aggregated live_rail_query

  end
end
