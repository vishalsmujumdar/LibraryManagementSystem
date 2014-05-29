class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :bookissues
  has_many :bookitems
  has_many :books, through: :bookissues

  # Validations
  #validates :name, presence: true
  #validates :employee_id, numericality: { only_integer: true }, length: { is: 6 }
  
end
