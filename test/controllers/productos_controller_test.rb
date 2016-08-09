require 'test_helper'

class ProductosControllerTest < ActionController::TestCase
  setup do
    @producto = productos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producto" do
    assert_difference('Producto.count') do
      post :create, producto: { activado: @producto.activado, aseguradora_id: @producto.aseguradora_id, destacado_id: @producto.destacado_id, nombre: @producto.nombre, precio: @producto.precio, tipoproducto_id: @producto.tipoproducto_id, tipovehiculo_id: @producto.tipovehiculo_id, url_compra: @producto.url_compra, url_poliza: @producto.url_poliza, usuario_id: @producto.usuario_id }
    end

    assert_redirected_to producto_path(assigns(:producto))
  end

  test "should show producto" do
    get :show, id: @producto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @producto
    assert_response :success
  end

  test "should update producto" do
    patch :update, id: @producto, producto: { activado: @producto.activado, aseguradora_id: @producto.aseguradora_id, destacado_id: @producto.destacado_id, nombre: @producto.nombre, precio: @producto.precio, tipoproducto_id: @producto.tipoproducto_id, tipovehiculo_id: @producto.tipovehiculo_id, url_compra: @producto.url_compra, url_poliza: @producto.url_poliza, usuario_id: @producto.usuario_id }
    assert_redirected_to producto_path(assigns(:producto))
  end

  test "should destroy producto" do
    assert_difference('Producto.count', -1) do
      delete :destroy, id: @producto
    end

    assert_redirected_to productos_path
  end
end
