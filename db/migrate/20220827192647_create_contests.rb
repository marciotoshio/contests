class CreateContests < ActiveRecord::Migration[7.0]
  def change
    create_table :contests do |t|
      t.string :name
      t.string :description
      t.string :platform
      t.string :registration
      t.string :timings

      t.timestamps
    end
  end
end
