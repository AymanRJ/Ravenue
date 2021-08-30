class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string, default: "https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png"
  end
end
