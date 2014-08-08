require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  
	test "a user should enter first name" do
  		user = User.new
  		assert !user.save

  		assert !user.errors[:first_name].empty?

	end

	test "a user should enter last name" do
  		user = User.new
  		assert !user.save

  		assert !user.errors[:last_name].empty?

	end

	test "a user should enter profile name" do
  		user = User.new
  		assert !user.save

  		assert !user.errors[:profile_name].empty?

	end

	test "a user should have unique profile name" do
  		user = User.new
  		
  		user.profile_name = users(:zeljko).profile_name

  		assert !user.save
  		puts user.errors.inspect
  		assert !user.errors[:profile_name].empty?

	end

	test "a user should have a  profile name without spaces" do

		user = User.new(first_name: 'jason', last_name: 'seifer', email: "hello@example.com")
    user.password = user.password_confirmation = 'dssdfsfs'

    user.profile_name = "jasonseiferr rrrr1212_ds-22"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly")

	end

  test "user has a correct formatted profile name" do
    user = User.new(first_name: 'jason', last_name: 'seifer', email: "hello@example.com")
    user.password = user.password_confirmation = 'dssdfsfs'

    user.profile_name = "jasonseiferrrrrr1212_ds-22"
    assert user.valid?
  end



end
