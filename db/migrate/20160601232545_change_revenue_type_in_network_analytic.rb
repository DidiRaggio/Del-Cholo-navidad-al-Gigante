class ChangeRevenueTypeInNetworkAnalytic < ActiveRecord::Migration
  def change
  	change_column :revenue, :decimal, :precision => 65, :scale => 4
  end
end
