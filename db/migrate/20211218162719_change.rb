class Change < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :pfp, :string, default: "https://i.imgur.com/igF2kHr.png"
  end
end
