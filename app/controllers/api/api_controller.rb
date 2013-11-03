class Api::ApiController < ApplicationController
  respond_to :json
  def showRoute
    begin
        @routes = Route.find(params[:id])
        @busstops = @routes.busstops
        render :json => @busstops
    rescue ActiveRecord::RecordNotFound => e
        render :json =>
        {
            status: 'Failed',
            results: 'No Record Found'
            
        }
    end

    
  end
end
