require 'csv'

namespace :import_candidate do
  desc "CSVファイルから読み込み"
  task :csv => :environment do
    filepath = "#{Rails.root}/tmp/*.csv"
    files = Dir.glob filepath

    files.each do | file_name |

      encoding = "UTF-16:UTF-8"
      csv_data = CSV.read(file_name, headers: true, encoding: encoding, col_sep: "\t")

      csv_data.each do | data |
        # データはどの求人も登録しちゃう
        # next unless Settings.job_ids.include? data["求人ID"].to_i
        # todo: CHIKARAWAZA
        data["応募日"] = Date.strptime(data["応募日"], '%Y年%m月%d日') if data["応募日"].present?
        data["1次面接実施日"] = Date.strptime(data["1次面接実施日"], '%Y年%m月%d日') if data["1次面接実施日"].present?
        data["2次面接実施日"] = Date.strptime(data["2次面接実施日"], '%Y年%m月%d日') if data["2次面接実施日"].present?
        data["3次面接実施日"] = Date.strptime(data["3次面接実施日"], '%Y年%m月%d日') if data["3次面接実施日"].present?
        data["4次面接実施日"] = Date.strptime(data["4次面接実施日"], '%Y年%m月%d日') if data["4次面接実施日"].present?
        data["5次面接実施日"] = Date.strptime(data["5次面接実施日"], '%Y年%m月%d日') if data["5次面接実施日"].present?
        data["最終面接実施日"] = Date.strptime(data["最終面接実施日"], '%Y年%m月%d日') if data["最終面接実施日"].present?
        data["内定日"] = Date.strptime(data["内定日"], '%Y年%m月%d日') if data["内定日"].present?
        data["内定承諾日"] = Date.strptime(data["内定承諾日"], '%Y年%m月%d日') if data["内定承諾日"].present?
        data["辞退日"] = Date.strptime(data["辞退日"], '%Y年%m月%d日') if data["辞退日"].present?
        data["不合格日"] = Date.strptime(data["不合格日"], '%Y年%m月%d日') if data["不合格日"].present?
        data["入社日"] = Date.strptime(data["入社日"], '%Y年%m月%d日') if data["入社日"].present?
        c = Candidate.create(
          hrmos_id: data["応募ID"],
          job_id: data["求人ID"],
          job_name: data["選考ポジション"],
          entry_date: data["応募日"],
          name: data["氏名"],
          entry_type: data["応募経路"],
          entry_origin: data["応募経路詳細"],
          status: data["選考ステータス"],
          first_interview_date: data["1次面接実施日"],
          first_interviewer_name: data["1次面接評価者"],
          second_interview_date: data["2次面接実施日"],
          second_interviewer_name: data["2次面接評価者"],
          third_interview_date: data["3次面接実施日"],
          third_interviewer_name: data["3次面接評価者"],
          fourth_interview_date: data["4次面接実施日"],
          fourth_interviewer_name: data["4次面接評価者"],
          fifth_interview_date: data["5次面接実施日"],
          fifth_interviewer_name: data["5次面接評価者"],
          last_interview_date: data["最終面接実施日"],
          last_interviewer_name: data["最終面接評価者"],
          offer_date: data["内定日"],
          accept_date: data["内定承諾日"],
          decline_date: data["辞退日"],
          failure_date: data["不合格日"],
          welcome_date: data["入社日"],
        )
      end
    end
  end
end
