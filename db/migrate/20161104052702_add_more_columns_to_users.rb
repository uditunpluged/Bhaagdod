class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_no, :numeric
    add_column :users, :status, :text
  end
end
