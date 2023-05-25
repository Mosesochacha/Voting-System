class CreateSubcounties < ActiveRecord::Migration[7.0]
  def change
    create_table :subcounties do |t|
      t.string :name
      t.references :county, null: false, foreign_key: true
      t.timestamps
    end
  end
end
