class Lecture < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :comments
  after_initialize :init
  acts_as_votable
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title, presence: true # Make sure the owner's name is present.

    def init
      self.user_id ||= User.current_user.id if User.current_user #will set the default value only if it's nil
    end
end
