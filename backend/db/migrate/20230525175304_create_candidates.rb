class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :education
      t.text :integrity
      t.string :image
      t.boolean :kenyan_citizen, default: true, null: false
      t.integer :age
      t.boolean :meets_educational_requirements, default: true, null: false
      t.boolean :meets_integrity_requirements, default: true, null: false
      t.boolean :nominated_by_party, default: false, null: false
      t.boolean :nominated_by_signatures, default: false, null: false
      t.boolean :meets_support_requirements, default: true, null: false
      t.text :manifesto
      t.references :party, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.references :ward, null: false, foreign_key: true
      t.timestamps
    end
  end
end
