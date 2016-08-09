json.array!(@my_apps) do |my_app|
  json.extract! my_app, :id, :usuario_id, :titulo, :app_id, :javascript_origins, :secret_key
  json.url my_app_url(my_app, format: :json)
end
