require 'json'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  $filepath = 'home/mako/test_2/file.json'
  
  $country = File.read($filepath)
  
  $tab_word = JSON.parse($country)
  
  $langue = "fr"
  
end

