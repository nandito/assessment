class RubyNumerals
  WORDS = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine',
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen',
      20 => 'twenty',
      30 => 'thirty',
      40 => 'forty',
      50 => 'fifty',
      60 => 'sixty',
      70 => 'seventy',
      80 => 'eighty',
      90 => 'ninety'
  }

  def two_digit_to_text(number)
    wordlist = WORDS
    if number < 21
      wordlist[number]
    else

      # Do not show 'zero' if there are no digit after teens.
      # If there are digits, show them as texts
      last_digit = number % 10
      last_digit == 0 ? last_digit_text = '' : last_digit_text = "-#{wordlist[last_digit]}"
      teens = (number - last_digit)

      "#{wordlist[teens]}#{last_digit_text}"
    end
  end

  def four_digit_to_text(number)
    # Do not show 'zero' if there are no teens.
    # If there are teens, show them as texts
    teens = number % 100
    teens == 0 ? teens_text = '' : teens_text = " and #{two_digit_to_text(teens)}"

    # Check if 'thousand' or 'hundred' should be shown
    hundreds = number / 100
    hundreds_text = if hundreds % 10 == 0
                      "#{two_digit_to_text(hundreds / 10)} thousand"
                    else
                      "#{two_digit_to_text(hundreds)} hundred"
                    end

    "#{hundreds_text}#{teens_text}"
  end

  def six_digit_to_text(number)
    thousands = number / 1_000
    hundreds = number - (thousands * 1_000)

    # Check if there are more than 2 digits of thousands
    # * if there are, use four_digit_to_text
    # * if there are not, use two_digit_to_text
    thousands_text = if thousands > 99
                       "#{four_digit_to_text(thousands)} thousand"
                     else
                       "#{two_digit_to_text(thousands)} thousand"
                     end

    # Do not show 'zero' if there are no hundreds.
    # If there are hundreds, check their digits
    # Elsif check: if there are more than 2 digits of hundreds
    # * if there are, use four_digit_to_text
    # * if there are not, use two_digit_to_text
    hundreds_text = if hundreds == 0
                      ''
                    elsif hundreds > 99
                      " and #{four_digit_to_text(hundreds)}"
                    else
                      " and #{two_digit_to_text(hundreds)}"
                    end

    "#{thousands_text}#{hundreds_text}"
  end

  def eight_digit_to_text(number)
    millions = number / 1_000_000
    under_million = number - millions * 1_000_000

    # Check if there are more than 2 digits of millions
    # * if there are, use four_digit_to_text
    # * if there are not, use two_digit_to_text
    millions_text = if millions > 99
                      "#{four_digit_to_text(millions)} million"
                    else
                      "#{two_digit_to_text(millions)} million"
                    end

    # Check the number under million
    # * if the number is a round million, do not add text
    # * if there are not zeros, use the six_digit_to_text method
    under_million_text = if under_million == 0
                           ''
                         else
                           " and #{six_digit_to_text(under_million)}"
                         end

    "#{millions_text}#{under_million_text}"
  end

  def number_to_string(number)
    # Check if the given variable is a Fixnum. If it is not, return a message
    if number.class == Fixnum
      # Use the proper method based on the given number
      # If the number is too high, return a message
      case
      when number < 0
          'Number should be positive!'
      when number >= 0 && number < 100
        two_digit_to_text(number)
      when number > 99 && number < 10_000
        four_digit_to_text(number)
      when number > 9_999 && number < 1_000_000
        six_digit_to_text(number)
      when number > 999_999 && number < 1_000_000_000
        eight_digit_to_text(number)
      else
        'Given number is too high.'
      end
    else
      "This value cannot be converted. Expect: Fixnum, Actual: #{number.class}"
    end
  end
end
