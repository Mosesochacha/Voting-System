class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :name
       t.string :image
       t.integer :party_code
       t.string  :abbreviation
       t.string :symbol_name 
      t.timestamps
    end
  end
end
