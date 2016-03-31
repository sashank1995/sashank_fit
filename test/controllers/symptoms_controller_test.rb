require 'test_helper'

class SymptomsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
