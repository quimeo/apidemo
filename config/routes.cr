require "../src/authenticate/*"
require "http/headers.cr"

Amber::Server.configure do |app|
  pipeline :web do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
    plug Authenticate.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug HTTP::StaticFileHandler.new("./public")
    plug HTTP::CompressHandler.new
  end

  # routes :static do
  #   # Each route is defined as follow
  #   # verb resource : String, controller : Symbol, action : Symbol
  #   get "/*", StaticController, :index
  # end

  routes :web do
    resources "/projects", ProjectController
    get "/", HomeController, :index
    get "/oauth2/token", Generate_tokenController, :new
  end
end
