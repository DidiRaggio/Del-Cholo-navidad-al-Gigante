class CreateNadaserves < ActiveRecord::Migration
  def change
    create_table :nadaserves do |t|
      t.integer :ad_source_connection_id
      t.integer :impressions
      t.decimal :revenue
      t.float :revenue_ecpm
      t.integer :bid
      t.float :bid_rate
      t.timestamp :run_start_timestamp
      t.timestamp :run_end_timestamp

      t.timestamps null: false
    end
  end
end
