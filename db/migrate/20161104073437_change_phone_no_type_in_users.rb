class ChangePhoneNoTypeInUsers < ActiveRecord::Migration
  def change
    change_column :users, :phone_no, :text
  end
end
