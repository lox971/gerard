class UsersController < ApplicationController

  def edit
    @customer = current_user
  end
end
