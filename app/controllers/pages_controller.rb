class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout 'static'

def home
  if current_user && current_user.provider == "facebook"
    redirect_to new_customer_path(current_user)
  else
  end

end
end
