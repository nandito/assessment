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

  it 'converts three digit number to text' do
    expect(@test.four_digit_to_text(999)).to eq('nine hundred and ninety-nine')
    expect(@test.four_digit_to_text(875)).to eq('eight hundred and seventy-five')
    expect(@test.four_digit_to_text(101)).to eq('one hundred and one')
    expect(@test.four_digit_to_text(110)).to eq('one hundred and ten')
    expect(@test.four_digit_to_text(100)).to eq('one hundred')
    expect(@test.four_digit_to_text(200)).to eq('two hundred')
  end

  it 'converts four digit number to text' do
    expect(@test.four_digit_to_text(1111)).to eq('eleven hundred and eleven')
    expect(@test.four_digit_to_text(2465)).to eq('twenty-four hundred and sixty-five')
    expect(@test.four_digit_to_text(9999)).to eq('ninety-nine hundred and ninety-nine')
  end

  it 'handles thousands without hundreds specially' do
    expect(@test.four_digit_to_text(2001)).to eq('two thousand and one')
    expect(@test.four_digit_to_text(3032)).to eq('three thousand and thirty-two')
    expect(@test.four_digit_to_text(4000)).to eq('four thousand')
  end
end
