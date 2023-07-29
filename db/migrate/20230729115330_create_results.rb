class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results, id: :uuid do |t|
      t.text :question, null: false
      t.text :answer, null: false
      t.timestamps
    end
    add_index :results, [:question, :answer]
  end
end
