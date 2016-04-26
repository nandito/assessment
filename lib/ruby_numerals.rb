class RubyNumerals

  def words
    {
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
  end

  def two_digit_to_text(number)
    wordlist = words
    if number < 21
      wordlist[number]
    else

      # Do not show 'zero' if there are no digit after teens. If there are digits, show them as texts
      last_digit = number%10
      last_digit == 0 ? last_digit_text = '' : last_digit_text = "-#{wordlist[last_digit]}"
      teens = (number-last_digit)

      "#{wordlist[teens]}#{last_digit_text}"
    end
  end

  def four_digit_to_text(number)

    # Do not show 'zero' if there are no teens. If there are teens, show them as texts
    teens = number%100
    teens == 0 ? teens_text = '' : teens_text = " and #{two_digit_to_text(teens)}"

    # Check if 'thousand' or 'hundred' should be shown
    hundreds = number/100
    if hundreds%10 == 0
      hundreds_text = "#{two_digit_to_text(hundreds/10)} thousand"
    else
      hundreds_text = "#{two_digit_to_text(hundreds)} hundred"
    end

    "#{hundreds_text}#{teens_text}"
  end

  def six_digit_to_text(number)
    thousands = number/1000
    hundreds = number - (thousands*1000)

    # Check if there are more than 2 digits of thousands and use four_digit_to_text if there are
    if thousands > 99
      thousands_text = "#{four_digit_to_text(thousands)} thousand"
    else
      thousands_text = "#{two_digit_to_text(thousands)} thousand"
    end

    # Do not show 'zero' if there are no hundreds. If there are hundreds, show check the digits of it
    if hundreds == 0
      hundreds_text= ''
    else

      # Check if there are more than 2 digits of hundreds_text and use four_digit_to_text if there are
      if hundreds > 99
        hundreds_text = " and #{four_digit_to_text(hundreds)}"
      else
        hundreds_text = " and #{two_digit_to_text(hundreds)}"
      end
    end

    "#{thousands_text}#{hundreds_text}"
  end

  def number_to_string(number)
    if number.class == Fixnum

      case
        when number > 0 && number < 100
          two_digit_to_text(number)
        when number > 99 && number < 10000
          four_digit_to_text(number)
        when number > 9999 && number < 1000000
          six_digit_to_text(number)
        else
          'Given number is too high.'
      end

    else
      "Given value is not a convertible number. (Actual: #{number.class}, Expected: Fixnum)"
    end

  end

end
