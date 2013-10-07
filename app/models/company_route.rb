class CompanyRoute < ActiveRecord::Base
    
    belongs_to :company
    belongs_to :route
end
