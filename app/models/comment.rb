class Comment < ApplicationRecord
  belongs_to :lecture, :polymorphic => true
  belongs_to :user
end
