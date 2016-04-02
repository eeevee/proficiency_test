require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe "name validation" do

  	context "name is present" do
		before(:each) do
			@course = FactoryGirl.build(:course)
		end

		it "should be valid" do
			expect(@course).to be_valid
		end
  	end

  	context "name is not present" do
		before(:each) do
			@course = FactoryGirl.build(:course, name: '')
		end

		it "should not be valid" do
			expect(@course).to_not be_valid
		end
  	end

  	context "can have a unique name" do
  		before(:each) do
			@course = FactoryGirl.create(:course)
			@course2 = FactoryGirl.build(:course)
		end

		it "the second course should not be valid" do
			expect(@course).to be_valid
			expect(@course2).to_not be_valid
		end
  	end
  end

  describe "description validation" do
  	context "description is present" do
  		before(:each) do
			@course = FactoryGirl.build(:course)
		end

		it "should be valid" do
			expect(@course).to be_valid
		end
  	end

  	context "description is not present" do
  		before(:each) do
			@course = FactoryGirl.build(:course, description: '')
		end

		it "should not be valid" do
			expect(@course).to_not be_valid
		end
  	end
  end
end
