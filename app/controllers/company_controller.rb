class CompanyController < Devise::RegistrationsController
  def index
    @companyRoutes = Route.all
  end
end