class BusstopController < ApplicationController
  before_filter :authenticate_isAdmin
  
  
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
    @busstops = Busstop.new(busstop_params)
    if @busstops.save
      redirect_to busstop_showAll_path
    else
      render 'showAll'
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

def authenticate_isAdmin
      if(admin_signed_in?)
          user = current_admin
          if(user.type == 'Admin')
              if(user.isAdmin?)
                  true
              else
                  flash[:notice] = 'Your account is not approved.'
                  redirect_to_back()
              end
          else
              flash[:notice] = 'You dont have admin privileges. Please login as \'Admin\''
              redirect_to_back()
          end
      else
          flash[:notice] = 'You need to sign in or sign up before continuing.'
          redirect_to new_admin_session_path
      end
  end

