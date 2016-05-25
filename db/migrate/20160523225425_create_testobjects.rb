class CreateTestobjects < ActiveRecord::Migration
  def change
    create_table :testobjects do |t|
      t.integer :ad_source_connection_id
      t.integer :impressions
      t.integer :revenue
      t.integer :revenue_ecpm
      t.integer :bid
      t.integer :bid_rate

      t.timestamps null: false
    end
  end
end
