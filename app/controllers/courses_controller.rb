class CoursesController < ApplicationController
  def create
    course = Course.create(course_params)
    if course.valid?
      render json: course, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def index
    courses = Course.all.includes(:tutors)
    render json: courses.as_json(include: :tutors)
  end

  private

  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:name])
  end
end
