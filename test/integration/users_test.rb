require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
    test "guest user" do
        get links_path
        assert_select "button", "sign up"
        assert_select "button", "login"
    end
    test "user can be logged in" do
        sign_in users(:one)
        get links_path
        assert_select "button", "profile"
        assert_select "button", "log out"
    end
end
