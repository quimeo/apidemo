require "json"

module Basalt
  class ProjectAttr
    JSON.mapping(name: String, desc: String)

    @name : String | Nil
    @desc : String | Nil

    def initialize(@name, @desc)
    end
  end
end
