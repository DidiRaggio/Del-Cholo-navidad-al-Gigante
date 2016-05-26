class CreateTestobjects < ActiveRecord::Migration
  def change
    create_table :testobjects do |t|
      t.integer :ad_source_connection_id
      t.integer :impressions
      t.decimal :revenue
      t.float :revenue_ecpm
      t.integer :bid
      t.float :bid_rate
      t.datetime :start_timestamp
      t.datetime :end_timestamp

      t.timestamps null: false
    end
  end
end
