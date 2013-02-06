# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100215030316) do

  create_table "contenidos", :force => true do |t|
    t.string   "nombre"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "documento_id"
    t.integer  "user_id"
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contenidos", ["documento_id"], :name => "index_contenidos_on_documento_id"
  add_index "contenidos", ["lft"], :name => "index_contenidos_on_lft"
  add_index "contenidos", ["parent_id"], :name => "index_contenidos_on_parent_id"
  add_index "contenidos", ["rgt"], :name => "index_contenidos_on_rgt"
  add_index "contenidos", ["user_id"], :name => "index_contenidos_on_user_id"

  create_table "documentos", :force => true do |t|
    t.string   "nombre"
    t.string   "ubicacion"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "caratula"
    t.text     "agradecimientos"
    t.text     "dedicatoria"
    t.text     "resumen"
    t.text     "abstract"
    t.boolean  "poner_lot"
    t.boolean  "poner_lof"
  end

  add_index "documentos", ["user_id"], :name => "index_documentos_on_user_id"

  create_table "documentos_users", :id => false, :force => true do |t|
    t.integer  "documento_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documentos_users", ["documento_id", "user_id"], :name => "index_documentos_users_on_documento_id_and_user_id", :unique => true

  create_table "figuras", :force => true do |t|
    t.integer  "numero"
    t.text     "descripcion"
    t.integer  "orden"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.integer  "user_id"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
  end

  add_index "figuras", ["documento_id"], :name => "index_figuras_on_documento_id"
  add_index "figuras", ["user_id"], :name => "index_figuras_on_user_id"

  create_table "referencias", :force => true do |t|
    t.string   "nombre"
    t.string   "autor"
    t.string   "fecha"
    t.string   "titulo_articulo"
    t.string   "titulo_libro_revista_periodico"
    t.string   "volumen"
    t.string   "paginas"
    t.string   "libre1"
    t.string   "libre2"
    t.string   "edicion"
    t.string   "ubicacion"
    t.string   "editorial"
    t.string   "fecha_web"
    t.string   "direccion_web"
    t.string   "descripcion"
    t.integer  "user_id"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referencias", ["documento_id"], :name => "index_referencias_on_documento_id"
  add_index "referencias", ["user_id"], :name => "index_referencias_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.boolean  "admin"
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.text     "changes"
    t.integer  "number"
    t.datetime "created_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["versioned_type", "versioned_id"], :name => "index_versions_on_versioned_type_and_versioned_id"

end
