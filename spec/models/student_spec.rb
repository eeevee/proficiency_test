require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe "name validation" do

  	context "name is present" do
		before(:each) do
			@student = FactoryGirl.build(:student)
		end

		it "should be valid" do
			expect(@student).to be_valid
		end
  	end

  	context "name is not present" do
		before(:each) do
			@student = FactoryGirl.build(:student, name: '')
		end

		it "should not be valid" do
			expect(@student).to_not be_valid
		end
  	end
  end

  describe "register_number validation" do
  	context "register_number is present" do
  		before(:each) do
			@student = FactoryGirl.build(:student)
		end

		it "should be valid" do
			expect(@student).to be_valid
		end
  	end

  	context "register_number is not present" do
  		before(:each) do
			@student = FactoryGirl.build(:student, register_number: '')
		end

		it "should not be valid" do
			expect(@student).to_not be_valid
		end
  	end

  	context "can have a unique register_number" do
  		before(:each) do
			@student = FactoryGirl.create(:student)
			@student2 = FactoryGirl.build(:student)
		end

		it "the second student should not be valid" do
			expect(@student).to be_valid
			expect(@student2).to_not be_valid
		end
  	end
  end
end
