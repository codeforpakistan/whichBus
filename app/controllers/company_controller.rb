class CompanyController < Devise::RegistrationsController
    before_filter :authenticate_admin!
    before_filter :authenticate_company
    def index
        user = current_admin
        @companyRoutes = user.routes.all
    end

    def showAll
        user = current_admin
        @routes = Route.all
        @companyRouteRelations = user.company_routes.all
    end

    def addCompanyRoute
        companyId = current_admin.id
        id = params[:id]
        @companyRoute = CompanyRoute.new(:company_id => companyId, :route_id => id)
        route = Route.find(id)
        if(@companyRoute.save == true)
            flash[:notice] = "Route: #{route.routeName}  added successfully"
            redirect_to_back()
        else
            flash[:notice] = 'Record could not be saved. Check for any errors'
            redirect_to_back()
        end
    end

    def removeCompanyRoute
        id = params[:id]
        user = current_admin
        @companyRoute = CompanyRoute.where(:route_id => id, :company_id => user.id)
        if(@companyRoute.destroy_all)
            flash[:notice] = 'Route removed.'
            redirect_to_back()
        else
            flash[:notice] = 'Route could not be removed.'
            redirect_to_back()
        end
    end
    
    protected
    
    def authenticate_company
        if(admin_signed_in?)
            user = current_admin
            if user.type == 'Company'
                true
            else
                flash[:notice] = 'Sign in as a \'Company\' to access this page.'
                redirect_to_back()
            end
        else
            flash[:notice] = 'You need to sign in or sign up before continuing.'
            redirect_to new_admin_session_path
        end
    end
    

end