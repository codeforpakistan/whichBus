module ApplicationHelper

    def current_user_isAdmin?
        if(admin_signed_in?)
            if(current_admin.type == 'Admin')
                if(current_admin.isAdmin?)
                    true
                else
                    flash[:notice] = 'Your account is not approved.'
                    false
                end
            else
                flash[:notice] = 'Please sign in as \'Admin\'.'
                false
            end
        else
            flash[:notice] = 'Please Sign in as Admin'
            false
        end
    end
end