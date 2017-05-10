class LecturesController < InheritedResources::Base
# before_filter :authenticate_user!
before_action :authenticate_user!
load_and_authorize_resource
def upvote
  @lecture = Lecture.find(params[:id])
  @lecture.upvote_by current_user
  redirect_to :back
end

def downvote
  @lecture = Lecture.find(params[:id])
  @lecture.downvote_by current_user
  redirect_to :back
end
  private

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id, :remove_attachment)
    end
    #  @default_lecture = Lecture.find(lecture_params[:course_id])
end
