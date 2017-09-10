class HTTP::Server::Context
  property current_user : User?
end

class Authenticate < Amber::Pipe::Base
  def call(context)
    user_id = context.session["user_id"]?
    access_token = context.request.headers.["access_token"]?
    if access_token == nil
      access_token = context.params["access_token"]?
    end

    if access_token != ""
      token = Token.find_by :access_token, access_token.to_s
    end

    if token
      user_id = token.user_id
    end

    if user = User.find(user_id)
      context.current_user = user
      call_next(context)
    else
      return call_next(context) if ["/oauth2/token"].includes?(context.request.path)
      context.flash["warning"] = "Please login"
      context.response.headers.add "Location", "/login"
      context.response.status_code = 401
    end
  end
end
