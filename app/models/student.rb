class Student < ActiveRecord::Base
	validates :name, presence: true
	validates :status, presence: true
	validates :register_number, presence: true, uniqueness: true
end
