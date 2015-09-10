class MoversController < ApplicationController


  def show
    @mover = current_user.profile
  end

  def new
    @mover = Mover.new
  end

  def create
    @mover = Mover.new(mover_params)
    @mover.user = current_user
    @mover.status = false
    if @mover.save
      redirect_to confirmation_movers_path
    else
      render :new
    end
  end

  def edit
    @mover = current_user.profile
  end

  def update
    @mover = current_user.profile
    if @mover.update(mover_params)
      redirect_to mover_path(@mover)
    else
      render :edit
    end
  end


  def confirmation

  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :phone_number,
      :picture, :status )
  end

end
