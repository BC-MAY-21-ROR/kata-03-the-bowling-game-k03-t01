# frozen_string_literal: true

class Frame
  attr_accessor :first_try, :second_try, :score

  def initialize(first_try, second_try, score)
    @first_try = first_try
    @second_try = second_try
    @score = score
  end
end