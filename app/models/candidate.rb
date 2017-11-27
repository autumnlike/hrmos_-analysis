class Candidate < ApplicationRecord
  # いつか使うかも
  # enum status: { "書類選考": 1, "1次選考": 2, "2次選考": 3, "3次選考": 4, "4次選考": 5, "最終選考": 9, "内定": 10, "内定承諾": 11, "入社": 20, "辞退": 90, "重複として終了": 98, "不合格": 99, "未対応": 100 }
  enum entry_type: { "エージェント": 1, "求人媒体": 2, "ダイレクトソーシング": 3, "社員紹介": 4, "知人紹介": 5, "HRMOS求人ページ": 6, "その他": 9 }

  validates :hrmos_id, uniqueness: true, on: :create

  def self.summary(job_id = [])
    sql = 
			"select
				substring(entry_date, 1, 7) month,
				count(1) entry,
				count(status in ('1次選考', '2次選考', '書類選考', '最終選考', '未対応') or null) active,
				count(first_interview_date <> '' or null) first,
				count(second_interview_date <> '' or null) second,
				count(last_interview_date <> '' or null) last
				, count(offer_date <> '' or null) offer
				, count(accept_date <> '' or null) accept
				, count(welcome_date <> '' or null) welcome
				, count(last_interview_date <> '' and decline_date <> '' or null) decline
				from candidates c"
    sql += " where job_id in (" + job_id.join(',') + ")" if job_id.present?
    sql += " group by month" # 良くないよ
    ActiveRecord::Base.connection.select_all sql
  end
end
