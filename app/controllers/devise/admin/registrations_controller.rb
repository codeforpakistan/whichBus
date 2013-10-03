class Devise::Admin::RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_admin!
  def index
    if admin_signed_in?
     @admins = Admin.all
    else
      redirect_to new_admin_session_path
    end
    
  end
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
    #redirect_to busstop_showAll_path
  end
  
  def pendingUser
    if admin_signed_in?
      @adminPendingUsers = Admin.where( :approved => false)
    else
      redirect_to new_admin_session_path
    end
  end
end