class Api::ApiController < ApplicationController
  respond_to :json
  def showRoute
    @routes = Route.find(params[:id])
    @busstops = @routes.busstops
    render :json => @busstops

    
  end
end
