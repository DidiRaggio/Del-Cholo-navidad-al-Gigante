json.array!(@nadaserves) do |nadaserf|
  json.extract! nadaserf, :id, :ad_source_connection_id, :impressions, :revenue, :revenue_ecpm, :bid, :bid_rate, :start_timestamp, :end_timestamp
  json.url nadaserf_url(nadaserf, format: :json)
end
