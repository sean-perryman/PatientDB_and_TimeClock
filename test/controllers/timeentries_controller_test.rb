require 'test_helper'

class TimeentriesControllerTest < ActionController::TestCase
  setup do
    @timeentry = timeentries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timeentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timeentry" do
    assert_difference('Timeentry.count') do
      post :create, timeentry: {  }
    end

    assert_redirected_to timeentry_path(assigns(:timeentry))
  end

  test "should show timeentry" do
    get :show, id: @timeentry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timeentry
    assert_response :success
  end

  test "should update timeentry" do
    patch :update, id: @timeentry, timeentry: {  }
    assert_redirected_to timeentry_path(assigns(:timeentry))
  end

  test "should destroy timeentry" do
    assert_difference('Timeentry.count', -1) do
      delete :destroy, id: @timeentry
    end

    assert_redirected_to timeentries_path
  end
end
