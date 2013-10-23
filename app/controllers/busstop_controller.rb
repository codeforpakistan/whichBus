class BusstopController < ApplicationController
    before_filter :authenticate_admin!
    before_filter :authenticate_isAdmin#, :except => [:showAll, :view]
    #before_filter :authenticate_company, :only => [:showAll, :view], unless: :current_user_isAdmin?

    def index  
    end

    def showAll
        @busstops = Busstop.all
    end

    def view
        @busstop = Busstop.find(params[:id])
    end

    def new
        @busstop = Busstop.new
    end

    def createBusstop
        @busstop = Busstop.new(busstop_params)
        if @busstop.save
            redirect_to busstop_showAll_path
        else
            render 'new'
        end  
    end
    def showEdit
        @editBusstop = Busstop.find(params[:id])
    end

    def update
        @editBusstop = Busstop.find(params[:id])
        @editBusstop.update_attributes!(params.require(:busstop).permit(:busStopName, :busStopLatLong, :busStopSecName))
        redirect_to busstop_view_path(@editBusstop.id)
    end

    def destroy

        @busstops = Busstop.find(params[:id])
        @busstops.destroy
        redirect_to busstop_showAll_path
    end
    #Private Members for Busstop  
    private
    
    def busstop_params
        params.require(:busstop).permit(:busStopName, :busStopLatLong, :busStopSecName)
    end
    
    

end
