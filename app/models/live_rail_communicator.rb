class LiveRailCommunicator < ActiveRecord::Base
 def self.get_report(live_rail_query)
 
    LiverailsApi.instance.login
    LiverailsApi.instance.statistics_aggregated live_rail_query
 #    response = LiverailsApi.instance.statistics_aggregated live_rail_query
    
 #    puts 'this is the liverail json response'

	# # puts response
	# return response
  end
end
