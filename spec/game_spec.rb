require_relative '../src/game'

describe Game do
  let(:easy_scenario) { '14,45,61,52,41,-1,72,61,51,236' }
  let(:base_scenario) { '14,45,6/,5/,x ,01,7/,6/,x ,2/6' }
  let(:game) { Game.new(10) }

  it 'exists' do
    expect(Game).to be_a Class
  end

  xit 'returns a spare' do
  end

  xit 'returns a strike' do
  end

  xit 'returns a open' do
  end
end
