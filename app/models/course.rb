class Course < ActiveRecord::Base
	validates :name, presence: true
	validates :status, presence: true
	validates :description, presence: true

	enum status: [:active, :inactive]
end
