require_relative './screen'
require_relative './bonus'

class Game
  attr_accessor :plain_frames, :frames, :score, :final_score, :scores
  attr_reader :play_type, :bonus

  def initialize(plain_frames)
    @plain_frames = plain_frames
    @frames = []
    @score = 0
    @final_score = 0
    @scores = []
    @play_type = {
      spare: '/',
      strike: 'X',
      open: '-'
    }.freeze
    @bonus = Bonus.new
  end

  def start
    frames.each do |index, frame|
      if frame_open?(frame)
        first_try = 0
        second_try = 0
        first_try = frame.first if open?(frame.first)
        second_try = frame.second if open?(frame.second)
        score = first_try + second_try
        scores[index] = score
      elsif spare?(frame.second)
        score = 10 + bonus.spare(frames, index)
        scores[index] = score
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

  def frame_open?(frame)
    frame.first == play_type[:open] || frame.second == play_type[:open]
  end

  # TODO: create the scenario when the first try is a strike
  def bonus_spare(index)
    frame = frames[index + 1]
    frame.first
  end

  # TODO: refactor method by using small methods
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
  end
end

game = Game.new('14,45,61,52,41,-1,72,61,51,236')
game.fill_frames
game.show_frames
