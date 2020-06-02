class AddColumnsToDefaultDeviseUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
  end
end
