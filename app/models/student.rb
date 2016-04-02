class Student < ActiveRecord::Base
	has_many :classrooms, dependent: :restrict_with_error
  	has_many :courses, :through => :classrooms

	validates :name, presence: true
	validates :status, presence: true
	validates :register_number, presence: true, uniqueness: true

	enum status: [:active, :inactive]
end
