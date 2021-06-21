require_relative '../src/game'

describe Game do
  let(:easy_scenario) { '14,45,61,52,41,-1,72,61,51,236' }
  let(:base_scenario) { '14,45,6/,5/,x ,01,7/,6/,x ,2/6' }
  let(:easy_game) { Game.new(easy_scenario) }

  it 'exists' do
    expect(Game).to be_a Class
  end

  it 'returns a spare' do
    expect(easy_game.spare?('/')).to be_truthy
  end

  it 'returns a strike' do
    expect(easy_game.strike?(['X', ' '])).to be_truthy
  end

  it 'returns an open' do
    expect(easy_game.open?('-')).to be_truthy
  end

  it 'returns an open frame' do
    expect(easy_game.open_frame?(['4', '-'])).to be_truthy
  end

  context 'the are not bonus, just open frames' do
    it 'returns 67 as final score' do
      easy_game.fill_frames
      easy_game.start
      expect { easy_game.show_final_score }.to output("67\n").to_stdout
    end
  end

  it 'returns frames' do
    expect(easy_game.split_frames(['14', '45', '61', '52', '41', '-1', '72', '61', '51',
                                   '236'])).to eql([%w[1 4], %w[4 5], %w[6 1], %w[5 2], %w[4 1], %w[- 1], %w[7 2],
                                                    %w[6 1], %w[5 1], %w[2 3 6]])
  end
end
