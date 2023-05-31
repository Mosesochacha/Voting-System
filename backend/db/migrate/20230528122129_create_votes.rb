class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :voter, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.integer :votes
      t.integer :total_votes, default: 0
      t.float :percentage_gained, default: 0.0
      t.datetime :voting_start_date
      t.datetime :voting_end_date
      t.timestamps
    end
  end
end
