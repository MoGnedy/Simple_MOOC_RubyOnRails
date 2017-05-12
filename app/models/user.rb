class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :courses
  has_many :comments
  mount_uploader :image, ImageUploader
  cattr_accessor :current_user
  validates :name, :email, presence: true
  validates :name, length: { minimum: 6 }
  validates :name, uniqueness: { case_senitive: false }
  validates :name,
  format:{
    with: /\A[a-zA-Z]+(?: [a-zA-Z]+)\z/,
    message: "Only allows letters and one white space"
    }
    validates :email, uniqueness: { case_senitive: false }
    validates :email,
    format:{
      with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
      message: "Example : email@example.com"
      }
      
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
