class Frame
  attr_accessor :first_try, :second_try

  def initialize(first_try, second_try)
    @first_try = first_try
    @second_try = second_try
    @score = 0
  end
end
