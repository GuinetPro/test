require 'test_helper'

class CampanasControllerTest < ActionController::TestCase
  setup do
    @campana = campanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campana" do
    assert_difference('Campana.count') do
      post :create, campana: { nombre: @campana.nombre }
    end

    assert_redirected_to campana_path(assigns(:campana))
  end

  test "should show campana" do
    get :show, id: @campana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campana
    assert_response :success
  end

  test "should update campana" do
    patch :update, id: @campana, campana: { nombre: @campana.nombre }
    assert_redirected_to campana_path(assigns(:campana))
  end

  test "should destroy campana" do
    assert_difference('Campana.count', -1) do
      delete :destroy, id: @campana
    end

    assert_redirected_to campanas_path
  end
end
