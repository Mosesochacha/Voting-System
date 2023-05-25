class CreateWards < ActiveRecord::Migration[7.0]
  def change
    create_table :wards do |t|
      t.string :name
      t.references :subcounty, null: false, foreign_key: true
      t.timestamps
    end
  end
end
