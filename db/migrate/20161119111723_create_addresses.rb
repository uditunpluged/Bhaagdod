class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_addr
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.boolean :preffered ,default:false
      t.timestamps null: false
    end
  end
end
