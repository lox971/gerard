class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.profile_type == "mover"
      new_mover_path
    else
      new_course_path
    end
  end
end
