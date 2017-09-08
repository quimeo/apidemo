require "granite_orm/adapter/pg"

class Token < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field access_token : String
  field user_id : Int64
  timestamps
end
