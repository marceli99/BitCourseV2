class ApplicationController < Application
  def index
    api_data
  end
  def api
    api_data
    respond_to do |format|
      format.json  { render :json => @chart_data.to_json }
    end
  end
end
