class Course < ApplicationRecord
  belongs_to :user
  has_many :lectures
  after_initialize :init

    def init
      self.user_id ||= User.current_user.id if User.current_user #will set the default value only if it's nil
    end
end
