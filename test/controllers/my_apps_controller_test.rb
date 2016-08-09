require 'test_helper'

class MyAppsControllerTest < ActionController::TestCase
  setup do
    @my_app = my_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_app" do
    assert_difference('MyApp.count') do
      post :create, my_app: { app_id: @my_app.app_id, javascript_origins: @my_app.javascript_origins, secret_key: @my_app.secret_key, titulo: @my_app.titulo, usuario_id: @my_app.usuario_id }
    end

    assert_redirected_to my_app_path(assigns(:my_app))
  end

  test "should show my_app" do
    get :show, id: @my_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_app
    assert_response :success
  end

  test "should update my_app" do
    patch :update, id: @my_app, my_app: { app_id: @my_app.app_id, javascript_origins: @my_app.javascript_origins, secret_key: @my_app.secret_key, titulo: @my_app.titulo, usuario_id: @my_app.usuario_id }
    assert_redirected_to my_app_path(assigns(:my_app))
  end

  test "should destroy my_app" do
    assert_difference('MyApp.count', -1) do
      delete :destroy, id: @my_app
    end

    assert_redirected_to my_apps_path
  end
end
