class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters, id: false do |t|
      t.bigint :id_number, primary_key: true
      t.string :full_names
      t.string :sex
      t.date :date_of_birth
      t.string :county
      t.string :subcounty
      t.integer :age
      t.string :national
      t.string :email
      t.references :ward, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
