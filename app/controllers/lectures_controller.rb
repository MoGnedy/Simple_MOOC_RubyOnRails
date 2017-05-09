class LecturesController < InheritedResources::Base
before_filter :authenticate_user!
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end
    #  @default_lecture = Lecture.find(lecture_params[:course_id])
end
