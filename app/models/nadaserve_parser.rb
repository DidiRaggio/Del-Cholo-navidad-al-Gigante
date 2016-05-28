class NadaserveParser < ActiveRecord::Base
  def self.create_or_update_from_liverail_row(response)
    #logic
    		responseVerification = response['liverailapi']['status']
		puts 'accessing the report was a ' + responseVerification

		
		if responseVerification == "success"
			# Builds NadaserveParser for logic
			# from here


			responseRows = response['liverailapi']['report']['row']
			# BUILD A LiverailsApiCommunicator for the logic
			# to here

			responseRows.each do |responseRow|
				# Get or build item
			  item = Nadaserve.where(ad_source_connection_id: responseRow["ad_source_connection_id"]).first
			 
			  if item

			  	puts 'Nadaserve#' + responseRow["ad_source_connection_id"].to_s + ' already existed, but was updated'
			  else
			  	item = Nadaserve.new
			  	item.ad_source_connection_id = responseRow["ad_source_connection_id"]

			  	puts 'Created Nadaserve#' + responseRow["ad_source_connection_id"].to_s 
				end

				# Update the item itself
				item.impressions = responseRow["impressions"]
				item.revenue = responseRow["revenue"].delete('$ ,')
				item.revenue_ecpm = responseRow["revenue_ecpm"]
				item.bid = responseRow["bid"] 
				item.bid_rate = responseRow["bid_rate"]
				item.end_timestamp = (Time.now - 1.hours ).strftime("%Y-%m-%d %H:0:0")
				item.start_timestamp = (Time.now - 2.hours ).strftime("%Y-%m-%d %H:0:0")


				item.save
			end
			# Builds TestObjectParser for logic
			# to here

		end
  end
end
