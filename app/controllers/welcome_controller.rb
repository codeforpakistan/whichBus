class WelcomeController < ApplicationController
    
    layout 'custom'
    
    def welcome
      render :layout => false
    end

end
