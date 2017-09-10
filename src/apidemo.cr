require "amber"
require "../config/*"
require "./models/**"
require "./mailers/**"
require "./handlers/**"

# load the application_controller before controllers which depend on it
require "./controllers/application_controller"
require "./controllers/**"

require "./data.cr"
require "./init.cr"
require "./json_constructor.cr"
require "./basalt_ams.cr"

Amber::Server.start
