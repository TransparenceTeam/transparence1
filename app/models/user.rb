class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_posts, dependent: :destroy
  has_many :posts, dependent: :destroy
  #has_many :matches, dependent: :destroy
  before_create :check_attributes

  acts_as_favoritor

  def check_attributes

  end
end
