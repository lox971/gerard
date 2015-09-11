class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    if params[:mover]
      new_mover_path
    else
      new_customer_path
    end
  end

end
