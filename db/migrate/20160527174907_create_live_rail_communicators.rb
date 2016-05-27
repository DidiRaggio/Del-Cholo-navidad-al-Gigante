class CreateLiveRailCommunicators < ActiveRecord::Migration
  def change
    create_table :live_rail_communicators do |t|

      t.timestamps null: false
    end
  end
end
