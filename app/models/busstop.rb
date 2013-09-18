class Busstop < ActiveRecord::Base
  has_many :routes
  belongs_to :user
  
end
