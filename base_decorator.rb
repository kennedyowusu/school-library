require 'forwardable'

class Decorator
  extend Forwardable
  def_delegators :@nameable, :correct_name

  def initialize(nameable)
    @nameable = nameable
  end

  attr_reader :nameable
end
