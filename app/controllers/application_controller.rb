require 'httparty'

class ApplicationController < ActionController::Base

  API_URL = 'https://api.coindesk.com/v1/bpi/currentprice.json'

  def index
    api_data
  end

  def api
    api_data
    respond_to do |format|
      format.json { render :json => @chart_data.to_json }
    end
  end

  protected

  def api_data
    response = HTTParty.get(API_URL)
    current_price_json = JSON.parse(response.body)
    @current_price = current_price_json['bpi']['USD']['rate_float'].round(0)
    @date = Time.zone.today
    url = 'https://api.coindesk.com/v1/bpi/historical/close.json?start=' + (@date - 1.year).to_s + '&end=' + @date.to_s
    response = HTTParty.get(url)
    history_price_json = JSON.parse(response.body)
    history_price = history_price_json['bpi']
    @chart_data = {
        today: @current_price,
        yesterday: history_price[(@date - 1.day).to_s].round(0),
        week_ago: history_price[(@date - 1.week).to_s].round(0),
        two_weeks_ago: history_price[(@date - 2.week).to_s].round(0),
        month_ago: history_price[(@date - 1.month).to_s].round(0),
        two_months_ago: history_price[(@date - 2.month).to_s].round(0),
        three_months_ago: history_price[(@date - 3.month).to_s].round(0),
        four_months_ago: history_price[(@date - 4.month).to_s].round(0),
        half_year_ago: history_price[(@date - 6.month).to_s].round(0),
        nine_months_ago: history_price[(@date - 9.month).to_s].round(0),
        year_ago: history_price[(@date - 1.year).to_s].round(0),
    }
  end
end
