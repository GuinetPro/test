require 'test_helper'

class AseguradorasControllerTest < ActionController::TestCase
  setup do
    @aseguradora = aseguradoras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aseguradoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aseguradora" do
    assert_difference('Aseguradora.count') do
      post :create, aseguradora: { name: @aseguradora.nombre }
    end

    assert_redirected_to aseguradora_path(assigns(:aseguradora))
  end

  test "should show aseguradora" do
    get :show, id: @aseguradora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aseguradora
    assert_response :success
  end

  test "should update aseguradora" do
    patch :update, id: @aseguradora, aseguradora: { name: @aseguradora.nombre }
    assert_redirected_to aseguradora_path(assigns(:aseguradora))
  end

  test "should destroy aseguradora" do
    assert_difference('Aseguradora.count', -1) do
      delete :destroy, id: @aseguradora
    end

    assert_redirected_to aseguradoras_path
  end
end
