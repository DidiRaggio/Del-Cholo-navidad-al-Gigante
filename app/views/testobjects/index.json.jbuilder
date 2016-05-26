json.array!(@testobjects) do |testobject|
  json.extract! testobject, :id, :ad_source_connection_id, :impressions, :revenue, :revenue_ecpm, :bid, :bid_rate, :start_timestamp, :end_timestamp
  json.url testobject_url(testobject, format: :json)
end
