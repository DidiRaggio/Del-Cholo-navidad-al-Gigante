namespace :objectif_tasks do |variable|

	desc "Log the db, delete the db, then update the db"

	task :update_test_object => :environment do

		# Libraries needed to parse the XML or JSON response.
		require 'nokogiri'
		require 'json'
		require 'open-uri'
		require 'liverails_api'
		puts 'libraries loaded'

		# #Set current time and format
		time = Time.new
		# current = time.strftime("%Y-%m-%d %H:%M:%S")

		# puts 'gets time'
		# puts time
		# puts current

		# present = (Time.now ).strftime("%Y-%m-%d %H:%M:%S")
		# puts 'gets current time'
		# puts present

		# past = (Time.now - 5.days - 12.hours).strftime("%Y-%m-%d %H:%M:%S")
		# puts 'time 1 hour ago'
		# puts past

		#HAVE TO COORDINATE UPDATE TIMES. LIVERAILS UPDATES automatically every 6 hours: each day at 00:00, 06:00, 12:00, 18:00, UTC time zone.
		# Define arguments for LiveRail '/statistics/aggregated' method
		my_args = { dimensions:"ad_source_connection_id",  metrics:"impressions,revenue,revenue_ecpm,bid_rate,bid", start:(Time.now - 5.days - 12.hours).strftime("%Y-%m-%d %H:%M:%S"), end:(Time.now ).strftime("%Y-%m-%d %H:%M:%S") }
		# puts my_args.to_query



		LiverailsApi.instance.login
		response = LiverailsApi.instance.statistics_aggregated my_args
		puts 'this is the liverail json response'
		puts response

			# Clean the db
		Testobject.destroy_all

		response['liverailapi']['report']['row'].each do |json_to|
		  # do whatever you want with these...
		  	to = Testobject.new
			to.ad_source_connection_id = json_to["ad_source_connection_id"]
			to.impressions = json_to["impressions"]
			to.revenue = json_to["revenue"].to_i
			to.revenue_ecpm = json_to["revenue_ecpm"].to_i 
			to.bid = json_to["bid"] 
			to.bid_rate = json_to["bid_rate"] 
	

			#I save it
			to.save
		  puts json_to['ad_source_connection_id']
		  puts json_to['impressions']
		  puts json_to['revenue']
		  puts json_to['revenue_ecpm']
		  puts json_to['bid']
		  puts json_to['bid_rate']
		end

	

		# # Use the api to update the db
		# url = open("#{foo}").read
		# # Response format to be determined
		# data1 = JSON.parse(response)
		# data2 = XML.parse(url)

		# data1.each do |json_c|
		# 	c = Test_Object.new
		# 	c.ad_source_connection_id = json_c["ad_source_connection_id"]
		# 	c.impressions = json_c["impressions"]
		# 	c.revenue = json_c["revenue"] 
		# 	c.revenue_ecpm = json_c["revenue_ecpm"] 
		# 	c.bid = json_c["bid"] 
		# 	c.bid_rate = json_c["bid_rate"] 
		# 	c.run_start_timestamp = json_c["run_start_timestamp"] 
		# 	c.run_end_timestamp = json_c["run_end_timestamp"] 

		# 	#I save it
		# 	c.save
		# end

		# data2.each do |xml_c|
		# 	c = Test_Object.new


		# end

	end
	
end