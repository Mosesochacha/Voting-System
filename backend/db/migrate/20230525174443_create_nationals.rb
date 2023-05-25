class CreateNationals < ActiveRecord::Migration[7.0]
  def change
    create_table :nationals do |t|
      t.string :name
      t.timestamps
    end
  end
end
