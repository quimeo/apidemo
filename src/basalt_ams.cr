class BasaltAms_m(T)
  @json_str : String | Nil
  @size : Int32 | Nil

  def initialize(@datas : T)
  end

  def build
    unless @datas.nil?
      if @datas.is_a?(Array)
        test = BasaltJsonMultiple.new(@datas)
        test.build
      end
    end
  end

  def print
  end
end

class BasaltAms_o(T)
  def initialize(@datas : T)
  end

  def build
    unless @datas.nil?
      test = BasaltJsonOne.new(@datas)
      test.build
    end
  end
end
