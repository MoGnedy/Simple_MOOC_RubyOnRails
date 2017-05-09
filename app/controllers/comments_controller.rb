class CommentsController < InheritedResources::Base
# before_filter :authenticate_user!
before_action :authenticate_user!

  private

    def comment_params
      params.require(:comment).permit(:content, :lecture_id)
    end
end
