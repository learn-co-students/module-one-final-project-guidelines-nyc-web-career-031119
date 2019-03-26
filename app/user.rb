class User < ActiveRecord::Base

has_many :user_show
has many :shows, through: :user_show



end
