class Comment < ApplicationRecord
  belongs_to :lecture, :polymorphic => true
  belongs_to :user

  after_initialize :init

    def init
      self.user_id ||= User.current_user.id if User.current_user #will set the default value only if it's nil
    end
end
