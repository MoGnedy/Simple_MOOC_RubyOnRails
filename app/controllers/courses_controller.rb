class CoursesController < InheritedResources::Base
  load_and_authorize_resource
  before_action :set_course, only: [:show]
  before_action :get_all_lectures, only: [:show]

  def get_all_lectures
    @lectures = @course.lectures.all
  end


  def get_my_courses
      @user = User.find(params[:user])
      if user_signed_in? && current_user.admin?
        @courses = Course.all
      else
        @courses = @user.courses.all
      end
  end

  def get_my_lectures
      @user = User.find(params[:user])
      if user_signed_in? && current_user.admin?
        @lectures = Lecture.all
      else
        @lectures = @user.lectures.all
      end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:title, :user_id)
    end
end
