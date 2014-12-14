class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :author, :inverse_of => :user

  def author_name
    author.try(:name)
  end

  def author_bio
    author.try(:biography)
  end
end
