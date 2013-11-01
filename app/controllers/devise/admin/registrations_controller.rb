class Devise::Admin::RegistrationsController < Devise::RegistrationsController
    before_filter :authenticate_admin!
    before_filter :authenticate_isAdmin, except: [:create, :new, :edit, :unApprovedAdmin, :welcome, :userProfile, :destroyUser]

    def welcome

    end

    def index
        @admins = Admin.all       #send all admins for listing. 
    end

    def create
        build_resource(sign_up_params)

        if resource.save
            if resource.active_for_authentication?
                set_flash_message :notice, :signed_up if is_navigational_format?
                sign_up(resource_name, resource)
                respond_with resource, :location => after_sign_up_path_for(resource)
            else
                set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
                expire_session_data_after_sign_in!
                respond_with resource, :location => after_inactive_sign_up_path_for(resource)
            end
        else
            clean_up_passwords resource
            respond_with resource
        end 
    end

    def destroyUser
        userToBeDeleted = Admin.find(params[:id])
        if not (current_admin.id == userToBeDeleted.id)
            if(userToBeDeleted.destroy)
                flash[:alert] = "#{userToBeDeleted.userName} has been deleted."
                redirect_to admin_index_path and return
            end
        else
            if(userToBeDeleted.destroy)
                flash[:alert] = "#{userToBeDeleted.userName} has been deleted."
                redirect_to root_path and return
            end
        end
    end

    def new
        super
        @admins = Admin.new
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

    def approveAdmin
        @user = Admin.find(params[:id])
        if(@user.approved?)
            flash[:notice] = "User Already Verified."
            redirect_to_back()
        else
            @user.approved = true
            #current_admin = current_admin.id
            @user.admin_id = current_admin.id
            if(@user.save)
                flash[:notice] = 'User Approved.'
                redirect_to :back
            else
                flash[:alert] = "Error Occured while updating record"
                redirect_to :back
            end
        end
    end
    
    def userProfile
      @user = Admin.find(params[:id])
    end
    
    protected

    def unApprovedAdmin
        #show this page for users with pending acount approval.
    end
    
    
    
    ########################From Devise Registrations Controller########################
    
    def update_needs_confirmation?(resource, previous)
        resource.respond_to?(:pending_reconfirmation?) &&
          resource.pending_reconfirmation? &&
          previous != resource.unconfirmed_email
      end

      # By default we want to require a password checks on update.
      # You can overwrite this method in your own RegistrationsController.
      def update_resource(resource, params)
        resource.update_with_password(params)
      end

      # Build a devise resource passing in the session. Useful to move
      # temporary session data to the newly created user.
      def build_resource(hash=nil)
        self.resource = resource_class.new_with_session(hash || {}, session)
      end

      # Signs in a user on sign up. You can overwrite this method in your own
      # RegistrationsController.
      def sign_up(resource_name, resource)
        sign_in(resource_name, resource)
      end

      # The path used after sign up. You need to overwrite this method
      # in your own RegistrationsController.
      def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
      end

      # The path used after sign up for inactive accounts. You need to overwrite
      # this method in your own RegistrationsController.
      def after_inactive_sign_up_path_for(resource)
        respond_to?(:root_path) ? root_path : "/"
      end

      # The default url to be used after updating a resource. You need to overwrite
      # this method in your own RegistrationsController.
      def after_update_path_for(resource)
        signed_in_root_path(resource)
      end

      # Authenticates the current scope and gets the current resource from the session.
      def authenticate_scope!
        send(:"authenticate_#{resource_name}!", :force => true)
        self.resource = send(:"current_#{resource_name}")
      end

      def sign_up_params
        devise_parameter_sanitizer.sanitize(:sign_up)
      end

      def account_update_params
        devise_parameter_sanitizer.sanitize(:account_update)
      end
    
    
end