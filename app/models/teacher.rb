class Teacher < ActiveRecord::Base
  has_many :labs
  has_many :students, through: :labs

  validates :name, presence: true
  validates :department, presence: true
end
