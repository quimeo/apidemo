require "granite_orm/adapter/pg"

class Project < Granite::ORM
  adapter pg

  primary id : Int64
  field name : String
  field description : String
  timestamps
end
