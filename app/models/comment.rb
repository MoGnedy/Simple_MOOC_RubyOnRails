class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }
  validates :comment, length: { minimum: 6 }
  validates :comment, presence: true
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  after_initialize :init

    def init
      self.user_id ||= User.current_user.id if User.current_user #will set the default value only if it's nil
    end

end
