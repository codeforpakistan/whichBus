class Admin < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


    has_one :admin, class_name: "Admin", foreign_key: "admin_id"
    has_one :busstop
    has_one :route
    has_one :route_busstop
    belongs_to :admin
    
end
