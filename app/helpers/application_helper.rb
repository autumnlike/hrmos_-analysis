module ApplicationHelper
  def percentage(num, base_num)
    if num == 0 || base_num == 0
      res = 0
    else
      res = (num / base_num.to_f * 100).round
    end
    " ( #{res.to_s}% )"
  end
end
