require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  describe "course validation" do

  	context "course is present" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom)
		end

		it "should be valid" do
			expect(@classroom).to be_valid
		end
  	end

  	context "course is not present" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom, course_id: '')
		end

		it "should not be valid" do
			expect(@classroom).to_not be_valid
		end
  	end
  end

  describe "student validation" do
  	context "student is present" do
  		before(:each) do
			@classroom = FactoryGirl.build(:classroom)
		end

		it "should be valid" do
			expect(@classroom).to be_valid
		end
  	end

  	context "student is not present" do
  		before(:each) do
			@classroom = FactoryGirl.build(:classroom, student_id: '')
		end

		it "should not be valid" do
			expect(@classroom).to_not be_valid
		end
  	end
  end

  describe "entry_at validation" do

  	context "entry_at is present" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom)
		end

		it "should be valid" do
			expect(@classroom).to be_valid
		end
  	end

  	context "entry_at is not present" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom, entry_at: '')
		end

		it "should not be valid" do
			expect(@classroom).to_not be_valid
		end
  	end

  	context "entry_at is a valid date" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom)
		end

		it "should be valid" do
			expect(@classroom).to be_valid
		end
  	end

  	context "entry_at is a invalid date" do
		before(:each) do
			@classroom = FactoryGirl.build(:classroom, entry_at: 'nao_eh_uma_data')
		end

		it "should not be valid" do
			expect(@classroom).to_not be_valid
		end
  	end
  end
end
