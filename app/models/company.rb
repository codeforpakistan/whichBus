class Company < Admin
    has_many :routes, through: :company_routes
    has_many :company_routes
end
