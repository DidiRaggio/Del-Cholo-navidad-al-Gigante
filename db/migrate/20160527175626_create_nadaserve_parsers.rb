class CreateNadaserveParsers < ActiveRecord::Migration
  def change
    create_table :nadaserve_parsers do |t|

      t.timestamps null: false
    end
  end
end
