class Comment < ApplicationRecord
  belongs_to :lecture, :polymorphic => true
end
