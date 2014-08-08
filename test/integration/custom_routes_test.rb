require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "that the /sign_in route opens the login page" do
  	get '/sign_in'
  	assert_response :success
  end

  test "that the /logout route opens the login page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that the /register route opens the login page" do
  	get '/register'
  	assert_response :success
  end

  test "that a profile page works" do
  	get '/zeljkoveic'
  	assert_response :success
  end


end
