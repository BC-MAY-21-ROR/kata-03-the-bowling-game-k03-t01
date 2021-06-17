# frozen_string_literal: true

# Initial class of game
class Game
  attr_accessor :frames, :final_score

  def initialize(frames)
    @frames = frames
    @final_score = 0
  end

  PLAY_TYPE = {
    spare: '/',
    strike: 'X',
    open: '-'
  }.freeze
  def start; end

  def tenth_frame; end

  def show_frames
    frames = '14,45,6/,5/,x ,01,7/,6/,x ,2/6'
    puts frames.split(',')
  end
end

Game.new.show_frames
