# config/initializers/sweetify.rb
require 'sweetify/engine'
require 'sweetify/sweetalert'
require 'sweetify/render'
ActionController::Base.send :include, Sweetify::SweetAlert
# possible options: 'sweetalert', 'sweetalert2'
Sweetify.sweetalert_library = 'sweetalert'
