class CoursesController < ApplicationController


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

    @course.save ? (redirect_to courses_path) : (render 'new')
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
