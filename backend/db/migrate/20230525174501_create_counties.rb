class CreateCounties < ActiveRecord::Migration[7.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.string :region
      t.float :area
      t.float :population
      t.string :capital
      t.string :code
      t.references :national, null: false, foreign_key: true
      t.timestamps
    end
  end
end
