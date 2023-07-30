class CreateResults < ActiveRecord::Migration[7.0]
  def change
    enable_extension('pg_trgm') unless extensions.include?('pg_trgm')
    enable_extension('pgcrypto') unless extensions.include?('pgcrypto')
    enable_extension('uuid-ossp') unless extensions.include?('uuid-ossp')

    create_table :results, id: :uuid do |t|
      t.text :question, null: false
      t.text :answer, null: false
      t.timestamps
    end
    add_index :results, [:question, :answer]
  end
end
