class AddAddressToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :address, index: true, foreign_key: true
  end
end
