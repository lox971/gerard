class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if resource.profile_type == "mover" || resource.profile_type == "Mover"
      new_mover_path
    else
      new_customer_path
    end
  end
end
