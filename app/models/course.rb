class Course < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :course_students
    has_many :students, class_name: "Account", through: :course_students
end


#a.errors.full_messages
