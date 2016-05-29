

namespace :live_rail_api do |variable|

	desc "Log the db, delete the db, then update the db"


	task :update_nadaserve => :environment do

		# Libraries needed to parse the SON response.
		require 'json'
		require 'liverails_api'
	
		live_rail_query = {dimensions:"ad_source_connection_id",
							metrics:"impressions,revenue,revenue_ecpm,bid_rate,bid",
							start:(Time.now ).strftime("%Y-%m-%d 00:00:00"),
							end:(Time.now ).strftime("%Y-%m-%d 23:59:59")
						  }
		
		response = LiveRailCommunicator.get_report(live_rail_query)

		NadaserveParser.create_or_update_from_liverail_row(response)


	end
end