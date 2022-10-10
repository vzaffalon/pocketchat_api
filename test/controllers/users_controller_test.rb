require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should be able to create a user" do
    post "/users", params: { first_name: "victor" }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal "victor", responseJson['first_name']
    assert_equal 200, @response.status
  end

  test "should not create a user when missing first_name" do
    post "/users", params: { first_name: nil }, xhr: true
    responseJson = JSON.parse(@response.body)
  
    assert_equal ["can't be blank"], responseJson['first_name']
    assert_equal 422, @response.status
  end
end
