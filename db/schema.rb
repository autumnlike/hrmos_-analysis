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

ActiveRecord::Schema.define(version: 20171107022344) do

  create_table "candidates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "hrmos_id", comment: "ハーモスID"
    t.integer "job_id", comment: "求人ID"
    t.date "entry_date", comment: "応募日"
    t.string "name", comment: "応募者"
    t.integer "entry_type", comment: "応募種類"
    t.string "entry_origin", comment: "応募元"
    t.integer "status", comment: "ステータス"
    t.string "first_interviewer_name", comment: "1次面接者"
    t.date "first_interview_date", comment: "1次面接日"
    t.string "second_interviewer_name", comment: "2次面接者"
    t.date "second_interview_date", comment: "2次面接日"
    t.string "third_interviewer_name", comment: "3次面接者"
    t.date "third_interview_date", comment: "3次面接日"
    t.string "fourth_interviewer_name", comment: "4次面接者"
    t.date "fourth_interview_date", comment: "4次面接日"
    t.string "fifth_interviewer_name", comment: "5次面接者"
    t.date "fifth_interview_date", comment: "5次面接日"
    t.string "last_interviewer_name", comment: "最終面接者"
    t.date "last_interview_date", comment: "最終面接日"
    t.date "offer_date", comment: "内定日"
    t.date "accept_date", comment: "内定承諾日"
    t.date "decline_date", comment: "辞退日"
    t.date "failure_date", comment: "不合格日"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
