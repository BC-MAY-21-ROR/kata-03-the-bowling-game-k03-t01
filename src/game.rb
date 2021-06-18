class Game
  attr_accessor :frames, :final_score

  def initialize(frames)
    @frames = frames
    @score = 0
    @final_score = 0
    @scores = []
  end

  PLAY_TYPE = {
    spare: '/',
    strike: 'X',
    open: '-'
  }.freeze

  def start
    frames.each do |index, frame|
      if frame_open?(frame)
        first_try = 0
        second_try = 0
        first_try = frame.first if open?(frame.first)
        second_try = frame.second if open?(frame.second)
        @score = first_try + second_try
        scores[index] = @score
      elsif spare?(frame.second)
        @score = 10 + bonus_spare(index)
        scores[index] = @score
      end
    end
  end

  # TODO: create last scenario
  def tenth_frame; end

  def strike?(frame)
    frame.first == PLAY_TYPE[:strike]
  end

  def spare?(try)
    try == PLAY_TYPE[:spare]
  end

  def open?(try)
    try == PLAY_TYPE[:open]
  end

  def frame_open?(frame)
    frame.first == PLAY_TYPE[:open] || frame.second == PLAY_TYPE[:open]
  end

  # TODO: create the scenario when the first try is a strike
  def bonus_spare(index)
    frame = frames[index + 1]
    frame.first
  end

  # TODO: refactor method by using small methods
  def show_frames
    input_frames = '14,45,6/,5/,x ,-1,7/,6/,x ,2/6'.split(',')
    9.times {|index| input_frames[index] = [input_frames[index][0], input_frames[index][1]] } 
    input_frames[9] = [input_frames[9][0], input_frames[9][1], input_frames[9][2]]
    input_frames.each do |frame|
      print "#{frame} "
    end
    puts
    9.times do
      print "    [#{9}]    "
    end
    print "      [#{9}]      "
  end
end
