class LessonsController < ApplicationController
before_action :authenticate_user!
before_action :require_authorized_for_current_course

  def show
  end

  private 

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_authorized_for_current_course
   if  !current_user.enrolled_in?(current_lesson.section.course)
      flash[:alert] ="Invalid login"
      redirect_to course_path(current_lesson.section.course)
    end
  end
end
