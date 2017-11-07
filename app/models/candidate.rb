class Candidate < ApplicationRecord
  # いつか使うかも
  # enum status: { "書類選考": 1, "1次選考": 2, "2次選考": 3, "3次選考": 4, "4次選考": 5, "最終選考": 9, "内定": 10, "内定承諾": 11, "入社": 20, "辞退": 90, "重複として終了": 98, "不合格": 99, "未対応": 100 }
  enum entry_type: { "エージェント": 1, "求人媒体": 2, "ダイレクトソーシング": 3, "社員紹介": 4, "知人紹介": 5, "HRMOS求人ページ": 6, "その他": 9 }

  validates :hrmos_id, uniqueness: true
end
