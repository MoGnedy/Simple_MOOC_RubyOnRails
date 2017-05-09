class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :courses
  mount_uploader :image, ImageUploader
  cattr_accessor :current_user

  def admin?
  self.role.name == "Admin"
  end

  def instructor?
  self.role.name == "Instructor"
  end

  def student?
  self.role.name == "Student"
  end
end
