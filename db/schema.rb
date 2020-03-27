# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_064035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "plot_paths", force: :cascade do |t|
    t.bigint "story_id"
    t.bigint "to_id"
    t.bigint "from_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_id"], name: "index_plot_paths_on_from_id"
    t.index ["story_id"], name: "index_plot_paths_on_story_id"
    t.index ["to_id"], name: "index_plot_paths_on_to_id"
  end

  create_table "plot_points", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "hidden"
    t.float "visibility_radius"
    t.decimal "latitude", precision: 15, scale: 12
    t.decimal "longitude", precision: 15, scale: 12
    t.bigint "story_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.geography "point_lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.index ["point_lonlat"], name: "index_plot_points_on_point_lonlat", using: :gist
    t.index ["story_id"], name: "index_plot_points_on_story_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "plot_paths", "plot_points", column: "from_id"
  add_foreign_key "plot_paths", "plot_points", column: "to_id"
  add_foreign_key "plot_paths", "stories"
  add_foreign_key "plot_points", "stories"
  add_foreign_key "stories", "users"
end
