require 'bcrypt'
class Account < ApplicationRecord
  attr_accessor :password

  before_save :encrypt_password

  has_many :course_students, foreign_key: :student_id
  has_many :courses, through: :course_students

  enum role: [:admin, :student]

  def encrypt_password
    if self.password.present?
      self.encrypted_password = BCrypt::Password.create(self.password)
    end
  end



 def self.authenticate(email, password)
  acc = Account.where(email: email).first

  return false unless acc && acc.encrypted_password

  if BCrypt::Password.new(acc.encrypted_password) == password
    return acc
  else
     return false
   end
 end

end


