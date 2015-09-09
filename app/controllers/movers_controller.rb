class MoversController < ApplicationController

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
    @mover = Mover.find(params[:id])
    @mover.update
    redirect_to show_mover_path(@mover)
  end

  def show
    @mover = current_user
  end

  def confirmation

  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :phone_number, :pictures, :status)
  end

end
