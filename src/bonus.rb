class Bonus
  def spare(_frames, _frame_index)
    next_try
  end

  def strike(_frames, _frame_index)
    fisrt_try + second_try
  end

  def next_try; end
end
