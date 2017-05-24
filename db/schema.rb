# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170522015927) do

  create_table "archivos", force: :cascade do |t|
    t.integer  "aseguradoras_id"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "pagina"
  end

  add_index "archivos", ["aseguradoras_id"], name: "index_archivos_on_aseguradoras_id"

  create_table "aseguradoras", force: :cascade do |t|
    t.string   "nombre"
    t.text     "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atributos", force: :cascade do |t|
    t.string   "campo"
    t.string   "llave"
    t.string   "valor"
    t.integer  "producto_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "atributos", ["producto_id"], name: "index_atributos_on_producto_id"

  create_table "campanas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destacados", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_apps", force: :cascade do |t|
    t.integer  "usuario_id"
    t.string   "titulo"
    t.string   "app_id"
    t.string   "javascript_origins"
    t.string   "secret_key"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "my_apps", ["usuario_id"], name: "index_my_apps_on_usuario_id"

  create_table "paginas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tipovehiculo_id"
    t.integer  "campana_id"
    t.integer  "my_app_id"
  end

  add_index "paginas", ["campana_id"], name: "index_paginas_on_campana_id"
  add_index "paginas", ["my_app_id"], name: "index_paginas_on_my_app_id"
  add_index "paginas", ["tipovehiculo_id"], name: "index_paginas_on_tipovehiculo_id"

  create_table "productos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "precio"
    t.boolean  "activado"
    t.string   "url_compra"
    t.string   "url_poliza"
    t.integer  "usuario_id"
    t.integer  "tipovehiculo_id"
    t.integer  "tipoproducto_id"
    t.integer  "aseguradora_id"
    t.integer  "destacado_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "proximo",         default: false
  end

  add_index "productos", ["aseguradora_id"], name: "index_productos_on_aseguradora_id"
  add_index "productos", ["destacado_id"], name: "index_productos_on_destacado_id"
  add_index "productos", ["tipoproducto_id"], name: "index_productos_on_tipoproducto_id"
  add_index "productos", ["tipovehiculo_id"], name: "index_productos_on_tipovehiculo_id"
  add_index "productos", ["usuario_id"], name: "index_productos_on_usuario_id"

  create_table "tienevigencias", force: :cascade do |t|
    t.integer  "producto_id"
    t.integer  "vigencia_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tienevigencias", ["producto_id"], name: "index_tienevigencias_on_producto_id"
  add_index "tienevigencias", ["vigencia_id"], name: "index_tienevigencias_on_vigencia_id"

  create_table "tipoproductos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipovehiculos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipovigencias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden"
  end

  create_table "tokenes", force: :cascade do |t|
    t.integer  "my_app_id"
    t.string   "token"
    t.datetime "experies_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tokenes", ["my_app_id"], name: "index_tokenes_on_my_app_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "rut",                    default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "perfil"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  add_index "usuarios", ["rut"], name: "index_usuarios_on_rut", unique: true

  create_table "vigencias", force: :cascade do |t|
    t.datetime "fecha_desde"
    t.datetime "fecha_hasta"
    t.string   "nombre"
    t.boolean  "activado"
    t.integer  "tipovigencia_id"
    t.integer  "campana_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "orden"
  end

  add_index "vigencias", ["campana_id"], name: "index_vigencias_on_campana_id"
  add_index "vigencias", ["tipovigencia_id"], name: "index_vigencias_on_tipovigencia_id"

end
