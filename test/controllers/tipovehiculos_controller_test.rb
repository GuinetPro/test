require 'test_helper'

class TipovehiculosControllerTest < ActionController::TestCase
  setup do
    @tipovehiculo = tipovehiculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipovehiculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipovehiculo" do
    assert_difference('Tipovehiculo.count') do
      post :create, tipovehiculo: { name: @tipovehiculo.nombre }
    end

    assert_redirected_to tipovehiculo_path(assigns(:tipovehiculo))
  end

  test "should show tipovehiculo" do
    get :show, id: @tipovehiculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipovehiculo
    assert_response :success
  end

  test "should update tipovehiculo" do
    patch :update, id: @tipovehiculo, tipovehiculo: { name: @tipovehiculo.nombre }
    assert_redirected_to tipovehiculo_path(assigns(:tipovehiculo))
  end

  test "should destroy tipovehiculo" do
    assert_difference('Tipovehiculo.count', -1) do
      delete :destroy, id: @tipovehiculo
    end

    assert_redirected_to tipovehiculos_path
  end
end
