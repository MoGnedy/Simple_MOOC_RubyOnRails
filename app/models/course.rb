class Course < ApplicationRecord
  belongs_to :user
  has_many :lectures
  validates :title, presence: true
  validates :title, length: { minimum: 6 }
  validates :title,
  format:{
    with: /\A[a-zA-Z]+(?:\s?[a-zA-Z]+)\z/,
    message: "Only allows letters and one white space optional"
    }
  after_initialize :init

    def init
      self.user_id ||= User.current_user.id if User.current_user #will set the default value only if it's nil
    end
end
