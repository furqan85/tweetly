class AddProviderToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :provider, :string
  end
end
