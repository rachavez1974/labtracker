class Lab < ActiveRecord::Base
  belongs_to :student
  validates :name, presence: true
  validates :description, presence: true
end
