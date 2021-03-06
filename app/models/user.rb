class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :candidates, dependent: :destroy
  has_many :voters, dependent: :destroy
  has_many :elections, dependent: :destroy

  def full_name
    full_name = [first_name.capitalize, last_name.capitalize].join(' ')
  end
  
end
