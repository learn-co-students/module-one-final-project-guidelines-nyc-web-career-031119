require 'bundler'
require 'colorize'
require 'curses'
require 'colorized_string'
width = Curses::cols

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger=nil
#require_all 'lib'
require_all 'app'
