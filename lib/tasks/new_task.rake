namespace :objectif_tasks do |variable|

	desc "Log the db, delete the db, then update the db"


	task :update_test_object => :environment do

		# Libraries needed to parse the XML or JSON response.
		require 'json'
		require 'liverails_api'




		# BUILD A LiverailsApiCommunicator for the logic
		# FROM HERE 
		# present = (Time.now ).strftime("%Y-%m-%d %H:%M:%S")
		present = (Time.now ).strftime("%Y-%m-%d 23:59:59")
		
		# past = (Time.now - 3.hours).strftime("%Y-%m-%d %H:%M:%S")
		past = (Time.now).strftime("%Y-%m-%d 00:00:00")

		presentFaux = (Time.now - 1.hours ).strftime("%Y-%m-%d %H:0:0")
		pastFaux = (Time.now - 2.hours ).strftime("%Y-%m-%d %H:0:0")
		
		#HAVE TO COORDINATE UPDATE TIMES. LIVERAILS UPDATES automatically every 6 hours: each day at 00:00, 06:00, 12:00, 18:00, UTC time zone.
		# Define arguments for LiveRail '/statistics/aggregated' method
		live_rail_query = { dimensions:"ad_source_connection_id",  metrics:"impressions,revenue,revenue_ecpm,bid_rate,bid", start: past, end: present }
		
		LiverailsApi.instance.login
		
		response = LiverailsApi.instance.statistics_aggregated live_rail_query

		puts 'this is the liverail json response'
		puts response
		responseRows = response['liverailapi']['report']['row']
		# BUILD A LiverailsApiCommunicator for the logic
		# to here



		# Builds TestObjectParser for logic
		# from here
		responseRows.each do |responseRow|
			# Get or build item
		  item = Testobject.where(ad_source_connection_id: responseRow["ad_source_connection_id"]).first
		 
		  if item

		  	puts 'Testobject#' + responseRow["ad_source_connection_id"].to_s + ' already existed, but was updated'
		  else
		  	item = Testobject.new
		  	item.ad_source_connection_id = responseRow["ad_source_connection_id"]

		  	puts 'Created Testobject#' + responseRow["ad_source_connection_id"].to_s 
			end

			# Update the item itself
			item.impressions = responseRow["impressions"]
			item.revenue = responseRow["revenue"].delete('$ ,')
			item.revenue_ecpm = responseRow["revenue_ecpm"]
			item.bid = responseRow["bid"] 
			item.bid_rate = responseRow["bid_rate"]
			item.end_timestamp = presentFaux
			item.start_timestamp = pastFaux


			item.save
		end
		# Builds TestObjectParser for logic
		# to here

	end
end