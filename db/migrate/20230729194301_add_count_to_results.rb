class AddCountToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :count, :integer, null: false, default: 1
    add_check_constraint :results, '(count > 0)', name: 'check_count_positive'
  end
end
