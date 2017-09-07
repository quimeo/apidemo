AMBER_ENV = ARGV[0]? || ENV["AMBER_ENV"]? || "development"

Amber::Server.configure do |setting|
  # Server options
  setting.name = "Apidemo web application."
  setting.port = (ENV["PORT"] ||= "3000").to_i # Port you wish your app to run
  setting.env = (ENV["AMBER_ENV"] ||= "development").to_s
  setting.log = ::Logger.new(STDOUT)
  setting.log.level = ::Logger::INFO
end
