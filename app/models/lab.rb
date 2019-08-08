class Lab < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
  has_many :experiments
  validates :name, presence: true
  validates :description, presence: true
end
