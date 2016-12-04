class User < ApplicationRecord
  # Direct associations

  has_many   :babies,
             :dependent => :destroy

  # Indirect associations

  # Validations
  # validates :username, :presence => true, :uniqueness => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
