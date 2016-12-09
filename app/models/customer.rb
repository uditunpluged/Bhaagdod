# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :integer
#

class Customer < ActiveRecord::Base
  has_many :addresses , dependent: :destroy
  accepts_nested_attributes_for :addresses

  def preferred_address
    addresses.where(preffered: true).last
  end

  def funky_method
    "#{self.name}.camelize"
  end
end
