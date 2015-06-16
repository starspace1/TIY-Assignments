require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get completed" do
    get :completed
    assert_response :success
  end

  test "should get active" do
    get :active
    assert_response :success
  end

  test "should get toggle_all_complete" do
    get :toggle_all_complete
    assert_response :success
  end

  test "should get destroy_all_complete" do
    get :destroy_all_complete
    assert_response :success
  end

  test "should get create_todo" do
    get :create_todo
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get toggle_complete" do
    get :toggle_complete
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
