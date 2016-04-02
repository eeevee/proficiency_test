class Course < ActiveRecord::Base
	has_many :classrooms, dependent: :restrict_with_error
  	has_many :students, :through => :classrooms

	validates :name, presence: true, uniqueness: true
	validates :status, presence: true
	validates :description, presence: true

	enum status: [:active, :inactive]
end