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
    redirect_to busstop_showAll_path
  end
  
end