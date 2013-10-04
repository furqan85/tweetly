class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :service_id
      t.string :access_token
      t.string :username

      t.timestamps
    end
  end
end
