class CreateNetworkAnalytics < ActiveRecord::Migration
  def change
    create_table :network_analytics do |t|
      t.integer :ad_source_connection_id
      t.integer :impressions
      t.decimal :revenue
      t.float :revenue_ecpm
      t.integer :bid
      t.float :bid_rate
      t.datetime :run_start_timestamp
      t.datetime :run_end_timestamp

      t.timestamps null: false
    end
  end
end
