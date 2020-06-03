class AddMessageToSitting < ActiveRecord::Migration[6.0]
  def change
    add_column :sittings, :message, :text
  end
end
