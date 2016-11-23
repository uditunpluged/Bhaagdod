# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  street_addr :string(255)
#  city        :string(255)
#  state       :string(255)
#  country     :string(255)
#  pincode     :string(255)
#  preffered   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#

class Address < ActiveRecord::Base
  belongs_to :customer
end
