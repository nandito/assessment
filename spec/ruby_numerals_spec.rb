require 'spec_helper'

describe 'RubyNumerals' do

  before do
    @test = RubyNumerals.new
  end

  it 'returns words array' do
    expect(@test.words).to include(5 => 'five')
  end

  it 'converts one digit number to text' do
    expect(@test.one_digit_to_text(0)).to eq('zero')
    expect(@test.one_digit_to_text(5)).to eq('five')
  end

  it 'converts less than 21 two digit number to text' do
    expect(@test.two_digit_to_text(10)).to eq('ten')
    expect(@test.two_digit_to_text(15)).to eq('fifteen')
    expect(@test.two_digit_to_text(12)).to eq('twelve')
    expect(@test.two_digit_to_text(20)).to eq('twenty')
  end

  it 'converts greater than 20 two digit number to text' do
    expect(@test.two_digit_to_text(21)).to eq('twenty-one')
    expect(@test.two_digit_to_text(55)).to eq('fifty-five')
    expect(@test.two_digit_to_text(76)).to eq('seventy-six')
  end
end
