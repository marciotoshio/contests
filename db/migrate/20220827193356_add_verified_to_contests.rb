class AddVerifiedToContests < ActiveRecord::Migration[7.0]
  def change
    add_column :contests, :verified, :boolean, default: false
  end
end
