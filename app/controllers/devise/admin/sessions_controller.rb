class Devise::Admin::SessionsController < Devise::SessionsController

  
  def create
    super
  end
  
  def new
   super
  end
  
  def edit
    super
  end
  def showAll
    flash[:notice] = "Sorry Wrong address"
  end
  
end