class Screen
  def show_frames(frames, _scores)
    9.times do |index|
      print "  #{frames[index][0]}|#{frames[index][1]}"
    end
    print "  #{frames[9][0]}|#{frames[9][1]}|#{frames[9][2]}      "
  end
end
