class Student < ActiveRecord::Base

  enum class_year: [:Freshman, :Sophomore, :Junior, :Senior]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 3}, allow_nil: true
  validates :user_name, presence: true, length: {maximum: 255}, 
                           format: {with: VALID_EMAIL_REGEX}, 
                           uniqueness: {case_sensitive: false}
  validates :class_year, presence: true
end
