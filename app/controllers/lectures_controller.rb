class LecturesController < InheritedResources::Base
before_action :authenticate_user!
before_action :set_lecture, only: [:show]
before_action :get_all_comments, only: [:show]
load_and_authorize_resource

def get_all_comments
  @comments = @lecture.comments.all
end

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
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    def lecture_params
      params.require(:lecture).permit(:title, :content, :attachment, :course_id, :user_id, :remove_attachment)
    end
    #  @default_lecture = Lecture.find(lecture_params[:course_id])
end
