require "jasper_helpers"
class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  LAYOUT = "application.slang"
end
