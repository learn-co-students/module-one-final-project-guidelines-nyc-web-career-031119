class User < ActiveRecord::Base
has_many :fosterings
has_many :animals, through: :fosterings

end
