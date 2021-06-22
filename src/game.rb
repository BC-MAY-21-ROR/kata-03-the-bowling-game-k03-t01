require_relative './screen'
require_relative './bonus'

class Game
  attr_accessor :plain_frames, :frames, :score, :scores
  attr_reader :play_type, :bonus

  def initialize(plain_frames)
    @plain_frames = plain_frames
    @frames = []
    @score = 0
    @scores = Array.new(10)
    @total_win = []
    @clean_items = []
    @play_type = {
      spare: '/',
      strike: 'X',
      open: '-'
    }.freeze
    # @bonus = Bonus.new
  end

  # TODO: add strike and spare scenario
  def start
    9.times do |index|
      @score = @score + @frames[index][0].to_i + @frames[index][1].to_i
      @scores[index] = @score
      @score
    end
    @score = @score + @frames[9][0].to_i + @frames[9][1].to_i + @frames[9][2].to_i
    @scores[9] = @score
  end

  def start_strike
    @frames.each do |item|
      @clean_items << [
        item[0] == '-' || item[0].empty? ? 0 : item[0],
        item[0] == 'X' || item[1].empty? ? 0 : item[1]
      ]
    end

    @clean_items.each do |item|
      item.map do |e|
        @total_win << 10 if e == 'X'
        @total_win.pop && @total_win << 10 if e == '/'
        @total_win << e.to_i if e.to_i > 0
      end
    end
  end

  # TODO: create last scenario
  def tenth_frame; end

  def strike?(frame)
    frame.first == play_type[:strike]
  end

  def spare?(try)
    try == play_type[:spare]
  end

  def open?(try)
    try == play_type[:open]
  end

  def open_frame?(frame)
    frame[0] == play_type[:open] || frame[1] == play_type[:open]
  end

  # TODO: create the scenario when the first try is a strike
  def bonus_spare(index)
    frame = frames[index + 1]
    frame.first
  end

  def show_frames
    Screen.new.show_frames(frames, scores)
  end

  def fill_frames
    frame_array = plain_frames.split(',')
    @frames = split_frames(frame_array)
  end

  def split_frames(frame_array)
    splitted_frames = Array.new(10)
    9.times { |index| splitted_frames[index] = [frame_array[index][0], frame_array[index][1]] }
    splitted_frames[9] = [frame_array[9][0], frame_array[9][1], frame_array[9][2]]
    splitted_frames
    # print splitted_frames
  end

  def show_final_score
    puts @score
    # puts @total_win.sum
  end
end
# easy_scenario
game = Game.new('14,45,61,52,41, 1,72,61,51,236')
game.fill_frames
game.start
game.show_final_score

# base_scenario
# game = Game.new('14,45,6/,5/,x ,01,7/,6/,x ,2/6')

# strike_scenario
# game = Game.new('x ,x ,x ,x ,x ,x ,x ,x ,x ,xxx')
