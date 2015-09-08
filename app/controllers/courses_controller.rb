class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: :preview

  def index
    if current_user.profile_id?
      @courses = Course.all
    elsif current_user.profile_type == "customer" || current_user.profile_type == "Customer"
      redirect_to new_customer_path
    else
      redirect_to new_mover_path
    end
  end

  def show
    @course = Course.find(params[:id])
    @markers = Gmaps4rails.build_markers(@course) do |course, marker|
      marker.lat course.sites.first.latitude
      marker.lng course.sites.first.longitude
    end
  end

  def new
    @course = Course.new
    @course.sites.build
  end


  def create
    @course = Course.create()
    site_pick_up = Site.new
    site_pick_up.address = params[:course][:sites_attributes]["0"]["address"]
    site_pick_up.type_of = params[:course][:sites_attributes]["0"]["type"]
    site_pick_up.save
    @course.sites << site_pick_up
    site_drop_of = Site.new
    site_drop_of.address = params[:course][:sites_attributes]["1"]["address"]
    site_drop_of.type_of = params[:course][:sites_attributes]["1"]["type"]
    site_drop_of.save
    @course.sites << site_drop_of

    if @course.save
      (redirect_to course_path(@course))
    else
      render 'new'
    end


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
