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
        90 => 'ninety',
        100 => 'hundred',
        1000 => 'thousand'
    }
  end

  def one_digit_to_text(number)
    wordlist = words
    wordlist[number]
  end

  def two_digit_to_text(number)
    wordlist = words
    if number < 21
      wordlist[number]
    else
      last_digit = number%10
      teens = (number-last_digit)
      
      "#{wordlist[teens]}-#{wordlist[last_digit]}"
    end
  end

  def four_digit_to_text(number)
    wordlist = words

    # Do not show 'zero' if there are no teens. If there are teens, show them as strings
    teens = number%100
    teens == 0 ? teens_text = '' : teens_text = " and #{two_digit_to_text(teens)}"

    # Check if 'thousand' or 'hundred' should be shown
    hundreds = number/100
    hundreds%10 == 0 ? hundreds_text = "#{wordlist[hundreds/10]} thousand" : hundreds_text = "#{two_digit_to_text(hundreds)} hundred"

    "#{hundreds_text}#{teens_text}"
  end
end
