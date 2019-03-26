require 'JSON'
require 'rest-client'
require 'pry'

class Question < ActiveRecord::Base
  has_many :question_masters
  has_many :players, through: :question_masters


end
