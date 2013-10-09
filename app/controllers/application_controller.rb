class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :userName << :firstName << :lastName << :streetAddress << :city << :town << :contactNumber << :secContactNumber << :organization << :admin_id << :type
        devise_parameter_sanitizer.for(:account_update) << :userName << :firstName << :lastName << :streetAddress << :city << :town << :contactNumber << :secContactNumber << :organization << :admin_id

    end

    def redirect_to_back(default = root_url)
        if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
            redirect_to :back and return
        else
            redirect_to default and return
        end
    end
    
    def authenticate_isAdmin
        if(admin_signed_in?)
            user = current_admin
            if(user.type == 'Admin')
                if(user.isAdmin?)
                    if(user.approved?)
                        true
                    else
                        flash[:notice] = 'Your account is awaiting approval. Please be patient.'
                        if (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["HTTP_URI"])
                            redirect_to :back
                        else
                            redirect_to ({:controller => 'devise/admin/registrations' ,:action => 'unApprovedAdmin'})
                        end
                    end
                else
                    flash[:notice] = 'Your account is awaiting approval. Please be patient.'
                    if (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["HTTP_URI"])
                        rediriect_to :back
                    else
                        redirect_to admin_unapproved_account
                    end
                end
            else
                flash[:notice] = 'Please sign in as \'Admin\' to view this page.'
                if (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["HTTP_URI"])
                    redirect_to :back
                else
                    redirect_to company_index_path
                end
                
            end
        else
            flash[:notice] = 'You need to sign in or sign up before continuing.'
            if (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["HTTP_URI"])
                redirect_to :back
            else
                redirect_to new_admin_session_path
            end
            
        end
    end
    
    def authenticate_company
        if(admin_signed_in?)
            user = current_admin
            if user.type == 'Company'
                if(user.approved?)
                    true
                else
                    flash[:notice] = 'Your account is awaiting approval. Please be patient.'
                    if (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["HTTP_URI"])
                        redirect_to :back
                    else
                        redirect_to admin_unapproved_account
                    end
                end
            else
                flash[:notice] = 'Sign in as a \'Company\' to access this page.'
                redirect_to :back
            end
        else
            flash[:notice] = 'You need to sign in or sign up before continuing.'
            redirect_to new_admin_session_path
        end
    end

end
