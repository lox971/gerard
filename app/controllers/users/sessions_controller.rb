class Users::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    if resource.profile_type == "Mover"
      movers_path
    elsif resource.profile_type == "Customer"
      customers_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
