require './base_decorator'

class TrimmerDecorator < Decorator
  MAX_NAME_LENGTH = 10

  def correct_name
    if @nameable.correct_name.length > MAX_NAME_LENGTH
      @nameable.correct_name[0..MAX_NAME_LENGTH - 1]
    else
      @nameable.correct_name
    end
  end
end
