class Nameable
  attr_reader :class_name

  def initialize
    @class_name = self.class.name
  end

  def correct_name
    raise NotImplementedError, "#{@class_name} does not implement '#{__method__}' method"
  end
end
