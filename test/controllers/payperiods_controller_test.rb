require 'test_helper'

class PayperiodsControllerTest < ActionController::TestCase
  setup do
    @payperiod = payperiods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payperiods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payperiod" do
    assert_difference('Payperiod.count') do
      post :create, payperiod: { end: @payperiod.end, start: @payperiod.start }
    end

    assert_redirected_to payperiod_path(assigns(:payperiod))
  end

  test "should show payperiod" do
    get :show, id: @payperiod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payperiod
    assert_response :success
  end

  test "should update payperiod" do
    patch :update, id: @payperiod, payperiod: { end: @payperiod.end, start: @payperiod.start }
    assert_redirected_to payperiod_path(assigns(:payperiod))
  end

  test "should destroy payperiod" do
    assert_difference('Payperiod.count', -1) do
      delete :destroy, id: @payperiod
    end

    assert_redirected_to payperiods_path
  end
end
