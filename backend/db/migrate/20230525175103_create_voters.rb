class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters do |t|
      t.string :id_number
      t.string :name
      t.references :ward, null: false, foreign_key: true
      t.timestamps
    end
  end
end
