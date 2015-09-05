class Users::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for(resource)
    if resource.profile_type == "mover" || "Mover"
      courses_path
    elsif resource.profile_type == "customer" || "Customer"
      new_course_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
