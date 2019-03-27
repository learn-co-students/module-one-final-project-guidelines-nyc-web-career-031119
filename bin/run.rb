require_relative '../config/environment'
require_relative "../app/api_communicator.rb"
require 'pry'
ActiveRecord::Base.logger = false

 CLI.new.start
