class CommentsController < InheritedResources::Base
before_action :authenticate_user!
before_action :find_commentable, only: :create
respond_to :js

def create
  @comment = @commentable.comments.new do |comment|
    comment.comment = params[:comment_text]
    comment.user = current_user
  end
  @comment.save

end

def destroy
  @user = Comment.find(params[:id]).user;
  @comment = @user.comments.find(params[:id])
  @comment_id = params[:id]
  @comment.destroy
end

private
def find_commentable
  @commentable_type = params[:commentable_type].classify
  @commentable = @commentable_type.constantize.find(params[:commentable_id])
end

  private

    def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end
end
