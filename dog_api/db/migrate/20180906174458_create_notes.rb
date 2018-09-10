class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :notes
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
