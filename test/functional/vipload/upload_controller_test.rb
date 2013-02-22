require 'test_helper'

module Vipload
  class UploadControllerTest < ActionController::TestCase
    test "should get create" do
      get :create
      assert_response :success
    end
  
  end
end
