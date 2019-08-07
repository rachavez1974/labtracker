class Lab < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
  validates :name, presence: true
  validates :description, presence: true
end
