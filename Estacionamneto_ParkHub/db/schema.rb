# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_07_145603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estacionamentos", force: :cascade do |t|
    t.bigint "veiculo_id", null: false
    t.bigint "vaga_id", null: false
    t.bigint "preco_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tickets_id", null: false
    t.index ["preco_id"], name: "index_estacionamentos_on_preco_id"
    t.index ["tickets_id"], name: "index_estacionamentos_on_tickets_id"
    t.index ["vaga_id"], name: "index_estacionamentos_on_vaga_id"
    t.index ["veiculo_id"], name: "index_estacionamentos_on_veiculo_id"
  end

  create_table "precos", force: :cascade do |t|
    t.float "preco_hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
  end

  create_table "tickets", force: :cascade do |t|
    t.date "hora_entrada"
    t.date "hora_saida"
    t.float "valor_cobrado"
    t.bigint "veiculo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["veiculo_id"], name: "index_tickets_on_veiculo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vagas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vaga"
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "marca"
    t.string "modelo"
    t.string "cor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
  end

  add_foreign_key "estacionamentos", "precos"
  add_foreign_key "estacionamentos", "tickets", column: "tickets_id"
  add_foreign_key "estacionamentos", "vagas"
  add_foreign_key "estacionamentos", "veiculos"
  add_foreign_key "tickets", "veiculos"
end
