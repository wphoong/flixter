class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in?(course)
    # enrolled_course = []
    # enrollments.each do |enrollment|
    # enrolled_course << enrollment.course
    # end

    # enrolled_courses = enrollments.collect do |enrollment|
    #   enrollment.course
    # end

    # enrolled_course = enrollments.collect($:course)

    enrolled_courses.include?(course)
  end
end
