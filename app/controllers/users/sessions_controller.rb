class Users::SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for(resource)
    if resource.profile_type == "Mover"
      current_mover = Mover.find(resource.profile_id)
      if current_mover.status == false
        confirmation_movers_path
      else
        courses_path
      end
    elsif resource.profile_type == "Customer"
      new_course_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

end
