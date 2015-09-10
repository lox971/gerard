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
    # TODO CALCUL DU PRIX SECURISE
    @markers = Gmaps4rails.build_markers(@course) do |course, marker|
      marker.lat @course.sites.first.latitude
      marker.lng @course.sites.first.longitude
    end
  end

  def new
    @course = Course.new
    @course.sites.build
  end

  def create
    @course = Course.create(course_params)
    @course.customer_id = current_user.id
    @course.sku = "course_" + @course.id.to_s
    @course.status = "pending"
    # Set kms / time / price using Google API
    @course.compute_infos

    if @course.save
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def preview
    @course = Course.create(course_params)
    @course.sku = "course_" + @course.id.to_s
    @course.status = "pending"

    # Set kms / time / price using Google API
    @course.compute_infos

    redirect_to root_path unless @course.save
  end

  private

  def course_params
    params.require(:course).permit(
      :mover_rating,
      :from,
      :status,
      sites_attributes: [ :address, :type_of ]
    )
  end

end
