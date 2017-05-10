class CoursesController < InheritedResources::Base
  load_and_authorize_resource
  before_action :set_course, only: [:show]
  before_action :get_all_lectures, only: [:show]
  def get_all_lectures
    @lectures = @course.lectures.all
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:title, :user_id)
    end
end
