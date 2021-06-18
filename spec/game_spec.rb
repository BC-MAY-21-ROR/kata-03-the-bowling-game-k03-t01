require_relative '../src/game'

describe Game do
  let (:easy_scenario) { '14,45,6/,5/,x ,01,7/,6/,x ,2/6' }
  let (:game) { Game.new(10)}
  
  it 'exists' do
    expect(Game).to be_a Class
  end

  it 'can tell is a spare' do
    expect(game.spare?('/')).to be true
  end
end
