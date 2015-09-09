class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout "static"

  def home
    @course = Course.new
    @course.sites.build
    if current_user && current_user.provider == "facebook"
      redirect_to new_course_path
    elsif current_user && current_user.profile_type == "Mover"
      redirect_to courses_path
    end
  end


  private

  def course_params
    params.require(:course).permit(:mover_rating)
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

