require_relative './frame'

class TenthFrame < Frame
  attr_accessor :third_try

  def initialize(first_try, second_try, third_try)
    super(first_try, second_try)
    @third_try = third_try
  end
end
