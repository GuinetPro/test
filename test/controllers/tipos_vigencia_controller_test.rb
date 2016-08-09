require 'test_helper'

class TiposVigenciaControllerTest < ActionController::TestCase
  setup do
    @tipo_vigencia = tipos_vigencia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipos_vigencia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_vigencia" do
    assert_difference('TipoVigencia.count') do
      post :create, tipo_vigencia: { nombre: @tipo_vigencia.nombre }
    end

    assert_redirected_to tipo_vigencia_path(assigns(:tipo_vigencia))
  end

  test "should show tipo_vigencia" do
    get :show, id: @tipo_vigencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_vigencia
    assert_response :success
  end

  test "should update tipo_vigencia" do
    patch :update, id: @tipo_vigencia, tipo_vigencia: { nombre: @tipo_vigencia.nombre }
    assert_redirected_to tipo_vigencia_path(assigns(:tipo_vigencia))
  end

  test "should destroy tipo_vigencia" do
    assert_difference('TipoVigencia.count', -1) do
      delete :destroy, id: @tipo_vigencia
    end

    assert_redirected_to tipos_vigencia_path
  end
end
