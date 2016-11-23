# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  category   :integer
#  team_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
