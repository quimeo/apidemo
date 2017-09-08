class Generate_tokenController < ApplicationController
  def new
    user_name = context.request.headers.["name"]?
    user_pass = context.request.headers.["password"]?
    if user_name == "" || user_pass == ""
      context.response.status_code = 401
      redirect_to("/login")
    end
    user = User.find_by :name, user_name
    if user && user.authenticate(user_name.to_s, user_pass.to_s) == true
      acs_token = SecureRandom.hex
      token = Token.new
      token.access_token = acs_token
      token.user_id = user.id
      token.save
      puts "#{acs_token}.to_json"
      token.access_token.to_json
    else
      context.response.status_code = 401
    end
  end
end
