class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
  validates :entry_at, presence: true

  validate :is_a_valid_date?
  validate :user_already_registered?

  private

  def is_a_valid_date?
  	errors.add(I18n.t('errors.notice'), I18n.t('errors.messages.invalid_date')) unless not entry_at.nil? and entry_at.to_datetime.is_a?(DateTime)
  end

  def user_already_registered?
    if changed?
  	   errors.add(I18n.t('errors.notice'), I18n.t('errors.messages.student_already_in_course')) unless Classroom.where(student_id: student_id, course_id: course_id).empty?
    end
  end
end
