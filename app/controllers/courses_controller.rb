class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :preview

  def index

    if current_user.profile_id?
    elsif current_user.profile_type == "customer" || "Customer"
      redirect_to new_customer_path
    else
      redirect_to new_mover_path
    end
  end

  def new
    @course = Course.new
    @course.sites.build
  end


  def create
    @course = Course.new(course_params)
    @site = @course.sites.build

    address
    @site = @course.sites.build
    type

    if params[:home]
      @course.save ? (redirect_to course_path(@course)) : (render 'pages/home')
    else
      @course.save ? (redirect_to courses_path) : (render 'new')
    end
  end

  def preview

  end


  private

  def course_params
    params.require(:course).permit(
      :mover_rating,
      :from
    )
  end

  def address
    params[:course][:sites_attributes]["0"].each do |key, value|
      if "address" == key
        @site.address = value
      else
        @site.type_of = value
      end
    end
  end
  def type
    params[:course][:sites_attributes]["1"].each do |key, value|
      if "address" == key
        @site.address = value
      else
        @site.type_of = value
      end
    end
  end
end
