# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string(255)
#  gender                 :boolean
#  first_name             :string(255)
#  last_name              :string(255)
#  dob                    :date
#  employee_id            :string(255)
#  phone_no               :text(65535)
#  status                 :text(65535)
#  team_id                :integer
#  category               :integer          default(1)
#

class User < ActiveRecord::Base
  rolify

  has_many :teams
  belongs_to :team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Coordinator validations
  validates  :last_name, presence: true, if: :is_coordinator?

  #Runner validations
  validates :first_name, presence: true, if: :is_runner?


  def self.importRunnersUsingRoo(file)
    spreadsheet=open_spreadsheet(file)
    header=spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row=Hash[[header, spreadsheet.row(i)].transpose]
      # user= find_by_id(row["id"]) || new
      # user.attributes = row.to_hash
      # user.save!

      values = row.to_hash
      values['category'] = 2
      User.create!(values).add_role(:runner)

    end
  end

  def self.importCoordinatorsUsingRoo(file)
    spreadsheet=open_spreadsheet(file)
    header=spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row=Hash[[header, spreadsheet.row(i)].transpose]
      # user= find_by_id(row["id"]) || new
      # user.attributes = row.to_hash
      # user.save!
      values = row.to_hash
      values['category'] = 3
      User.create!(values).add_role(:coordinator)
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then
        Roo::CSV.new(file.path)
    end
  end


  private

  def is_coordinator?
    category === 3
  end

  def is_runner?
    category === 2
  end

end
