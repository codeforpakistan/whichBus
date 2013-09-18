class Route < ActiveRecord::Base
  has_many :busstops
  belongs_to :user
end
