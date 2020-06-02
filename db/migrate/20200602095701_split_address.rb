class SplitAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :address, :street_address
    add_column :pets, :city, :string
    add_column :pets, :postcode, :string
    add_column :pets, :country, :string
  end
end
