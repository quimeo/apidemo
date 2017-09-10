require "granite_orm/adapter/pg"
require "crypto/bcrypt/password"

class User < Granite::ORM
  adapter pg

  # id : Int64 primary key is created for you
  field name : String
  field password : String
  timestamps

  def encrypt(str : String)
    str = Crypto::Bcrypt::Password.create(str, cost: 10).to_s
  end

  def authenticate(name : String, pass : String)
    enc = encrypt(pass)
    user = User.find_by :name, name
    user2 = User.find_by :password, pass
    if user && user2 && user.id == user2.id
      return true
    else
      return false
    end
  end
end
