class AddUidToConnection < ActiveRecord::Migration
  def change
    add_column :connections, :uid, :string
  end
end
