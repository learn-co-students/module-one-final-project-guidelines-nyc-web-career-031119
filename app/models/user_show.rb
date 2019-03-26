class UserShow < ActiveRecord::Base
  belongs_to :users
  belongs_to :shows
end
