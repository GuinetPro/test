require 'test_helper'

class DestacadosControllerTest < ActionController::TestCase
  setup do
    @destacado = destacados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:destacados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create destacado" do
    assert_difference('Destacado.count') do
      post :create, destacado: { name: @destacado.nombre }
    end

    assert_redirected_to destacado_path(assigns(:destacado))
  end

  test "should show destacado" do
    get :show, id: @destacado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @destacado
    assert_response :success
  end

  test "should update destacado" do
    patch :update, id: @destacado, destacado: { name: @destacado.nombre }
    assert_redirected_to destacado_path(assigns(:destacado))
  end

  test "should destroy destacado" do
    assert_difference('Destacado.count', -1) do
      delete :destroy, id: @destacado
    end

    assert_redirected_to destacados_path
  end
end
