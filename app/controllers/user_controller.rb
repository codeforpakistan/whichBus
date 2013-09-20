class UserController < ApplicationController
  def index
  end
  
  def signUp
  end
  
  def signIn
    
    
  end
  
  def authenticateUser
    @users = User.find(params[:userName])
    if @user.blank?
      @message[-1] = "User credentials incorrect"
      redirect_to 'signIn'
    end
  end
  
  def createUser
  end
  
  def destroy
  end
  
end
