class Devise::Admin::RegistrationsController < Devise::RegistrationsController

  
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