class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


    has_one :admin, class_name: "Admin", foreign_key: "admin_id"
    belongs_to :admin
    
    has_one :busstop
    has_one :route
    has_one :route_busstop
    
    
    validates :firstName, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: {minimum: 3, maximum: 8,}
    validates :lastName, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: {minimum: 3, maximum: 8,}
    validates :email, presence: true, uniqueness: true
    validates :userName, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: {minimum: 4, maximum: 10,}
    validates :contactNumber, presence: true, numericality: true
    validates :city, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, :allow_blank => true
    validates :town, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, :allow_blank => true
    validates :organization, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, :allow_blank => true
    validates :secContactNumber, numericality: true, :allow_blank => true
    validates :streetAddress, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, :allow_blank => true
    
    
end
