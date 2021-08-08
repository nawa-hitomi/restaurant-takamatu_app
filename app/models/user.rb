class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  belongs_to :prefecture, optional: true
         
  validates :name, presence: true #追記
  validates :age, presence: true #追記
end
