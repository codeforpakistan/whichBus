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
  
  def pendingUser     #find a way to check logged in user via before_filter
    if(admin_signed_in?)
        authenticate_isAdmin
        @allUsers = Admin.all(:order => :approved)
    else
        flash[:notice] = "You should be signed in first."
        redirect_to new_admin_session_path
    end
  end
  
  def approveUser
      authenticate_isAdmin
    if(admin_signed_in?)
      
      @user = Admin.find(params[:id])
      if(@user.approved?)
        flash[:notice] = "User Already Verified."
        redirect_to :back
      else
        @user.approved = true
        current_admin_id = current_admin.id
      
        @user.admin_id = current_admin_id
        if(@user.save)
          redirect_to :back
        else
          flash[:alert] = "Error Occured while updating record"
          redirect_to :back
        end
      end
    else
      flash[:notice] = "You need to login to perform this action"
      redirect_to :back
    end
  end
  
  protected
  def authenticate_isAdmin
      user = current_admin
      if(user.isAdmin?)
          true
      else
          flash[:notice] = 'You dont have admin privileges. Please login as \'Admin\''
          redirect_to :back
  end
  
  def admin_logged_in
     if(admin_signed_in?)
         true
     else
         flash[:notice] = 'You need to login to perform this action'
         redirect_to new_admin_session_path
     end
  end
  
end