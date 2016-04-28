require 'spec_helper'

describe 'RubyNumerals' do
  before do
    @test = RubyNumerals.new
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
    expect(@test.four_digit_to_text(1_111)).to eq('eleven hundred and eleven')
    expect(@test.four_digit_to_text(2_465)).to eq('twenty-four hundred and sixty-five')
    expect(@test.four_digit_to_text(9_999)).to eq('ninety-nine hundred and ninety-nine')
  end

  it 'handles thousands without hundreds specially' do
    expect(@test.four_digit_to_text(2_001)).to eq('two thousand and one')
    expect(@test.four_digit_to_text(3_032)).to eq('three thousand and thirty-two')
    expect(@test.four_digit_to_text(4_000)).to eq('four thousand')
  end

  it 'handles numbers under one million' do
    expect(@test.six_digit_to_text(40_000)).to eq('forty thousand')
    expect(@test.six_digit_to_text(40_011)).to eq('forty thousand and eleven')
    expect(@test.six_digit_to_text(41_000)).to eq('forty-one thousand')
    expect(@test.six_digit_to_text(56_300)).to eq('fifty-six thousand and three hundred')
    expect(@test.six_digit_to_text(99_999)).to eq('ninety-nine thousand and nine hundred and ninety-nine')
    expect(@test.six_digit_to_text(100_000)).to eq('one hundred thousand')
    expect(@test.six_digit_to_text(555_444)).to eq('five hundred and fifty-five thousand and four hundred and forty-four')
    expect(@test.six_digit_to_text(999_999)).to eq('nine hundred and ninety-nine thousand and nine hundred and ninety-nine')
  end

  it 'handles numbers above one million' do
    expect(@test.eight_digit_to_text(1_000_000)).to eq('one million')
    expect(@test.eight_digit_to_text(99_000_000)).to eq('ninety-nine million')
    expect(@test.eight_digit_to_text(100_000_000)).to eq('one hundred million')
    expect(@test.eight_digit_to_text(5_000_000_000)).to eq('five thousand million')
    expect(@test.eight_digit_to_text(1_100_025)).to eq('one million and one hundred thousand and twenty-five')
    expect(@test.eight_digit_to_text(893_421_056)).to eq('eight hundred and ninety-three million and four hundred and twenty-one thousand and fifty-six')
  end

  it 'let the user know if given value is not a convertible number' do
    expect(@test.number_to_string('test text')).to eq('This value cannot be converted. Expect: Fixnum, Actual: String')
  end

  it 'let the user know if given value is too high to convert' do
    expect(@test.number_to_string(1_000_000_000)).to eq('Given number is too high.')
  end

  it 'converts any length of numbers using one method' do
    expect(@test.number_to_string(-10)).to eq('Number should be positive!')
    expect(@test.number_to_string(0)).to eq('zero')
    expect(@test.number_to_string(5)).to eq('five')
    expect(@test.number_to_string(15)).to eq('fifteen')
    expect(@test.number_to_string(22)).to eq('twenty-two')
    expect(@test.number_to_string(100)).to eq('one hundred')
    expect(@test.number_to_string(500)).to eq('five hundred')
    expect(@test.number_to_string(687)).to eq('six hundred and eighty-seven')
    expect(@test.number_to_string(1_000)).to eq('one thousand')
    expect(@test.number_to_string(7_020)).to eq('seven thousand and twenty')
    expect(@test.number_to_string(9_998)).to eq('ninety-nine hundred and ninety-eight')
    expect(@test.number_to_string(20_000)).to eq('twenty thousand')
    expect(@test.number_to_string(555_444)).to eq('five hundred and fifty-five thousand and four hundred and forty-four')
    expect(@test.number_to_string(1_000_000)).to eq('one million')
    expect(@test.number_to_string(893_421_056)).to eq('eight hundred and ninety-three million and four hundred and twenty-one thousand and fifty-six')
  end
end
