require 'spec_helper'

describe 'RubyNumerals' do

  before do
    @test = RubyNumerals.new
  end

  it 'returns words array' do
    expect(@test.words).to include(5 => 'five')
  end

  it 'converts one digit number to text' do
    expect(@test.two_digit_to_text(0)).to eq('zero')
    expect(@test.two_digit_to_text(5)).to eq('five')
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
    expect(@test.two_digit_to_text(30)).to eq('thirty')
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

  it 'handles numbers under one million' do
    expect(@test.six_digit_to_text(40000)).to eq('forty thousand')
    expect(@test.six_digit_to_text(40011)).to eq('forty thousand and eleven')
    expect(@test.six_digit_to_text(41000)).to eq('forty-one thousand')
    expect(@test.six_digit_to_text(56300)).to eq('fifty-six thousand and three hundred')
    expect(@test.six_digit_to_text(99999)).to eq('ninety-nine thousand and nine hundred and ninety-nine')
    expect(@test.six_digit_to_text(100000)).to eq('one hundred thousand')
    expect(@test.six_digit_to_text(555444)).to eq('five hundred and fifty-five thousand and four hundred and forty-four')
    expect(@test.six_digit_to_text(999999)).to eq('nine hundred and ninety-nine thousand and nine hundred and ninety-nine')
  end

  it 'let\'s the user know if given value is not a convertable number' do
    expect(@test.number_to_string('test text')).to eq('Given value is not a convertible number. (Actual: String, Expected: Fixnum)')
  end

  it 'let\'s the user know if given value is too high to convert' do
    expect(@test.number_to_string(999999999)).to eq('Given number is too high.')
  end

  it 'converts any length of numbers using one method' do
    expect(@test.number_to_string(5)).to eq('five')
    expect(@test.number_to_string(15)).to eq('fifteen')
    expect(@test.number_to_string(22)).to eq('twenty-two')
    expect(@test.number_to_string(500)).to eq('five hundred')
    expect(@test.number_to_string(687)).to eq('six hundred and eighty-seven')
    expect(@test.number_to_string(1000)).to eq('one thousand')
    expect(@test.number_to_string(7020)).to eq('seven thousand and twenty')
    expect(@test.number_to_string(9998)).to eq('ninety-nine hundred and ninety-eight')
    expect(@test.number_to_string(20000)).to eq('twenty thousand')
    expect(@test.number_to_string(555444)).to eq('five hundred and fifty-five thousand and four hundred and forty-four')
  end
end
