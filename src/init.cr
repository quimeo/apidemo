require "json"
require "./data.cr"

module Basalt
  class Init
    def initialize
      @datas = [] of ProjectObj
    end

    def <<(data : ProjectObj)
      @datas << data
    end

    def to_json
      wrapper = {data: @datas}
      wrapper.to_pretty_json
    end
  end
end
