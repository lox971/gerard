class MoversController < ApplicationController

  def new
    @mover = Mover.new
  end


  def create
    @mover = Mover.new(mover_params)
    @mover.user = current_user
    if @mover.save
      redirect_to courses_path
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
    @move = current_user
  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :phone_number, :pictures)
  end

end
