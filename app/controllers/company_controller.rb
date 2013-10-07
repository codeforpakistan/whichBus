class CompanyController < Devise::RegistrationsController
    before_filter :authenticate_company
  def index
      user = current_admin
      
    @companyRoutes = user.routes.all
    @companyRoutes = user.company_routes.all
  end
  
  def showAll
     @routes = Route.all
  end
  
  def addCompanyRoute
      companyId = current_admin.id
      id = params[:id]
      @companyRoute = CompanyRoute.new(:company_id => companyId, :route_id => id)
      if(@companyRoute.save == true)
          flash[:notice] = 'Record saved successfully'
          redirect_to :back
      else
          flash[:notice] = 'Record could not be daved. Check for any errors'
          redirect_to :back
      end
  end
  
  
  
  
  
  
  protected
  
  def authenticate_company
    if(admin_signed_in?)
        user = current_admin
        if user.type == 'Company'
            true
        else
            flash[:notice] = 'Sign in as a partner to access this page.'
            redirect_to new_admin_session_path
        end
    end
  end
end