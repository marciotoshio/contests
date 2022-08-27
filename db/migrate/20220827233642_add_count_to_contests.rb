class AddCountToContests < ActiveRecord::Migration[7.0]
  def change
    add_column :contests, :count, :integer, default: 0
  end
end
