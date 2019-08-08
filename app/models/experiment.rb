class Experiment < ActiveRecord::Base
  belongs_to :lab

  validates :name, presence: true
  validates :description, presence: true
end
