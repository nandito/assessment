require 'spec_helper'

describe 'RubyNumerals' do

  before do
    @test = RubyNumerals.new()
  end

  it 'returns words array' do
    expect(@test.words).to include(5 => 'five')
  end
end
