require 'test_helper'

class VigenciasControllerTest < ActionController::TestCase
  setup do
    @vigencia = vigencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vigencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vigencia" do
    assert_difference('Vigencia.count') do
      post :create, vigencia: { activado: @vigencia.activado, campana_id: @vigencia.campana_id, fecha_desde: @vigencia.fecha_desde, fecha_hasta: @vigencia.fecha_hasta, nombre: @vigencia.nombre, tipoVigencia_id: @vigencia.tipoVigencia_id }
    end

    assert_redirected_to vigencia_path(assigns(:vigencia))
  end

  test "should show vigencia" do
    get :show, id: @vigencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vigencia
    assert_response :success
  end

  test "should update vigencia" do
    patch :update, id: @vigencia, vigencia: { activado: @vigencia.activado, campana_id: @vigencia.campana_id, fecha_desde: @vigencia.fecha_desde, fecha_hasta: @vigencia.fecha_hasta, nombre: @vigencia.nombre, tipoVigencia_id: @vigencia.tipoVigencia_id }
    assert_redirected_to vigencia_path(assigns(:vigencia))
  end

  test "should destroy vigencia" do
    assert_difference('Vigencia.count', -1) do
      delete :destroy, id: @vigencia
    end

    assert_redirected_to vigencias_path
  end
end
