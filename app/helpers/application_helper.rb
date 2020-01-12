module ApplicationHelper
  def percent_value(a, b)
    ((a.to_f - b.to_f) / b.to_f * 100).round(2).to_s + '%'
  end
end