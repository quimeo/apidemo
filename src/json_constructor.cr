require "json"

class BasaltJsonOne(T)
  def initialize(@datas : T)
  end

  def build
    test = nil
    test = Basalt::ProjectData.new(Basalt::ProjectObj.new("project", @datas.id, Basalt::ProjectAttr.new(@datas.name, @datas.description)))
    test.to_json
  end
end

class BasaltJsonMultiple(T)
  def initialize(@datas : T)
    puts "JSON MULTIPLE"
  end

  def build
    test = Basalt::Init.new
    puts "TYPE=>#{typeof(@datas)}"
    puts "RES=>#{@datas}"
    @datas.each do |data|
      test << Basalt::ProjectObj.new("project", data.id, Basalt::ProjectAttr.new(data.name, data.description))
    end
    test.to_json
  end
end
