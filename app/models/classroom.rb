class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :entry_at, presence: true

  validate :user_already_registered?

  def user_already_registered?
  	errors.add(:base, I18n.t('errors.messages.student_already_in_course')) unless Classroom.where(student_id: student_id, course_id: course_id).empty?
  end
end
