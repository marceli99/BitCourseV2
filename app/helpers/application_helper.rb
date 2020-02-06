module ApplicationHelper
  def percent_value(a, b)
    ((a.to_f - b.to_f) / b.to_f * 100).round(2).to_s + '%'
  end

  def percentage_from(date)
    percent_value(@current_price, @chart_data[date])
  end

  def percentage_color(value)
    if value.to_f > 0
      "high"
    else
      "low"
    end
  end

end