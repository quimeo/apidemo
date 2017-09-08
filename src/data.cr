require "json"
require "./obj.cr"

module Basalt
  class ProjectObj
    JSON.mapping(type: String, id: Int64, attributes: ProjectAttr)

    @type : String | Nil
    @id : Int64 | Nil
    @attributes : ProjectAttr | Nil

    def initialize(@type, @id, @attributes)
    end
  end

  class ProjectData
    JSON.mapping(data: ProjectObj)

    @data : ProjectObj

    def initialize(@data)
    end
  end
end
