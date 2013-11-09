class Api::ApiController < ApplicationController
  respond_to :json
  def showRoute
    begin
        @routes = Route.find(params[:id])
        @busstops = @routes.busstops
        render :json => {:routes => @busstops}
    rescue ActiveRecord::RecordNotFound => e
        render :json =>
        {
            status: 'Failed',
            results: 'No Record Found'
            
        }
    end
    
    
    def savePolyLineData
#       begin
          busstopID = params[:busStopID]
          routeID = params[:routeID]
          nextBusstop = params[:nextBusStopID]
          render :json => { :status => 'OK'}

       
        
    end

    
  end
end
