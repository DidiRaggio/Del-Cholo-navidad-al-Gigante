namespace :objectif_tasks do |variable|

	desc "Log the db, delete the db, then update the db"

	task :update_test_object => :environment do

		# Libraries needed to parse the XML or JSON response.
		require 'nokogiri'
		require 'json'
		require 'open-uri'
		# require 'crack'
		# require ''
		# require 'live-rails-api'
		require 'liverails_api'
		# puts 'libraries loaded'

		# #Set current time and format
		# time = Time.new
		# current = time.strftime("%Y-%m-%d %H:%M:%S")

		# puts 'gets time'
		# puts time
		# puts current

		present = (Time.now ).strftime("%Y-%m-%d %H:%M:%S")
		# puts 'gets current time'
		# puts present

		past = (Time.now - 30.days - 12.hours).strftime("%Y-%m-%d %H:%M:%S")
		# puts 'time 1 hour ago'
		# puts past

		#HAVE TO COORDINATE UPDATE TIMES. LIVERAILS UPDATES automatically every 6 hours: each day at 00:00, 06:00, 12:00, 18:00, UTC time zone.
		# Define arguments for LiveRail '/statistics/aggregated' method
		my_args = { dimensions:"ad_source_connection_id",  metrics:"impressions,revenue,revenue_ecpm,bid_rate,bid", start:past, end:present }
		# puts my_args.to_query



		LiverailsApi.instance.login
		response = LiverailsApi.instance.statistics_aggregated my_args
		puts 'this is the liverail json response'
		puts response



		response['liverailapi']['report']['row'].each do |json_to|
			
		  # do whatever you want with these...
		  	existingItem = Testobject.where(ad_source_connection_id: json_to["ad_source_connection_id"])
		  if existingItem

		 	puts 'this ad_source_connection_id ' + json_to["ad_source_connection_id"] + ' exists'
		  	
			existingItem.ad_source_connection_id = json_to["ad_source_connection_id"]
			existingItem.impressions = json_to["impressions"]
			existingItem.revenue = json_to["revenue"].delete('$ ,')
			existingItem.revenue_ecpm = json_to["revenue_ecpm"]
			existingItem.bid = json_to["bid"] 
			existingItem.bid_rate = json_to["bid_rate"]

			existingItem.save
		  	
		  else

		  	puts 'this ad_source_connection_id ' + json_to["ad_source_connection_id"] + ' does not exists'

			newItem = Testobject.new
			newItem.ad_source_connection_id = json_to["ad_source_connection_id"]
			newItem.impressions = json_to["impressions"]
			newItem.revenue = json_to["revenue"].delete('$ ,')
			newItem.revenue_ecpm = json_to["revenue_ecpm"]
			newItem.bid = json_to["bid"] 
			newItem.bid_rate = json_to["bid_rate"]

			#I save it
			newItem.save


		  end


		end

	



	end
	
end