class LecturesController < InheritedResources::Base
# before_filter :authenticate_user!
before_action :authenticate_user!
load_and_authorize_resource
  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :remove_attachment)
    end
    #  @default_lecture = Lecture.find(lecture_params[:course_id])
end
