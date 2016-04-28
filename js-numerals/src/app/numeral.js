// Define words for numbers
var words = {
    "0": "zero",
    "1": "one",
    "2": "two",
    "3": "three",
    "4": "four",
    "5": "five",
    "6": "six",
    "7": "seven",
    "8": "eight",
    "9": "nine",
    "10": "ten",
    "11": "eleven",
    "12": "twelve",
    "13": "thirteen",
    "14": "fourteen",
    "15": "fifteen",
    "16": "sixteen",
    "17": "seventeen",
    "18": "eighteen",
    "19": "nineteen",
    "20": "twenty",
    "30": "thirty",
    "40": "forty",
    "50": "fifty",
    "60": "sixty",
    "70": "seventy",
    "80": "eighty",
    "90": "ninety"
};

// Convert two digit numbers to text
function twoDigitsToText(number) {
    'use strict';
    // The numbers under 21 are predefined
    if (number < 21) {
        return (words[number]);
    }
    var lastDigit, teens, lastDigitAsText, teensAsText;

    // Get the last digit of the number
    lastDigit = number % 10;
    // If the last digit is 0, there is nothing to show
    // Else show the word for the last digit
    if (lastDigit === 0) {
        lastDigitAsText = '';
    } else {
        lastDigitAsText = '-' + words[lastDigit];
    }

    // The teens are predefined
    teens = number - lastDigit;
    teensAsText = words[teens];

    // Concatenate teens and last digits
    return teensAsText + lastDigitAsText;
}

// Convert four digit numbers to text - handle hundreds and thousands
function fourDigitsToText(number) {
    'use strict';
    var teens, hundreds, teensAsText, hundredsAsText;

    // Get the last two digits of the number
    teens = number % 100;
    // If the last two digits are 0, do not add anything
    // Else use the twoDigitsToText function and add the 'and' word
    if (teens === 0) {
        teensAsText = '';
    } else {
        teensAsText = ' and ' + twoDigitsToText(teens);
    }

    // Get the hundreds of the number
    hundreds = (number - teens) / 100;
    // If the second digit of the hundred is 0, use the 'thousand' word
    // Else use the 'hundred' word
    if (hundreds % 10 === 0) {
        hundredsAsText = twoDigitsToText(hundreds / 10) + ' thousand';
    } else {
        hundredsAsText = twoDigitsToText(hundreds) + ' hundred';
    }

    // Concatenate hundreds and teens
    return hundredsAsText + teensAsText;
}

// Convert six digit numbers to text - handle hundreds of thousands
function sixDigitsToText(number) {
    'use strict';
    var hundreds, thousands, hundredsAsText, thousandsAsTexts;

    // Get the hundreds of the number
    hundreds = number % 1000;
    // Get the thousands of the number
    thousands = (number - hundreds) / 1000;

    // If the thousands are more than 99 use the fourDigitsToText converter
    // Else use the twoDigitsToText converter
    if (thousands > 99) {
        thousandsAsTexts = fourDigitsToText(thousands) + ' thousand';
    } else {
        thousandsAsTexts = twoDigitsToText(thousands) + ' thousand';
    }

    // Do not show any hundreds there are no hundreds
    // If the hundreds are more than 99 use the fourDigitsToText converter
    // Else use the twoDigitsToText converter
    if (hundreds === 0) {
        hundredsAsText = '';
    } else {
        if (hundreds > 99) {
            hundredsAsText = ' and ' + fourDigitsToText(hundreds);
        } else {
            hundredsAsText = ' and ' + twoDigitsToText(hundreds);
        }
    }

    // Concatenate thousands and hundreds
    return thousandsAsTexts + hundredsAsText;
}

// Convert eight digit numbers to text - handle millions
function eightDigitsToText(number) {
    'use strict';
    var millions, underMillion, millionsAsText, underMillionAsText;

    // Get the number of millions and the number under the millions
    underMillion = number % 1000000;
    millions = (number - underMillion) / 1000000;

    // If there are more than 99 millions, use the fourDigitsToText converter and add 'million'
    // Else use the twoDigitsToText converter and add 'million'
    if (millions > 99) {
        millionsAsText = fourDigitsToText(millions) + ' million';
    } else {
        millionsAsText = twoDigitsToText(millions) + ' million';
    }

    // If it is a round number, do not show anything else
    // Else use the sixDigitsToText converter to get the proper words
    if (underMillion === 0) {
        underMillionAsText = '';
    } else {
        underMillionAsText = ' and ' + sixDigitsToText(underMillion);
    }

    // Concatenate millions and the number under millions
    return millionsAsText + underMillionAsText;
}

// Concatenate the converter methods and show the value on the website
function numeral() {
    'use strict';
    // Get value from the input field
    var inputNumber = document.getElementById("inputNumber").value,
        resultElement = document.getElementById("result"),
        errorElement = document.getElementById("error"),
        parsedInput = parseInt(inputNumber, 10);

    // Value block switch and update value
    function showValue(value) {
        resultElement.innerHTML = value;
        resultElement.style.display = 'block';
        errorElement.style.display = 'none';
    }

    // Error block switch and update error
    function showError(error) {
        errorElement.innerHTML = error;
        errorElement.style.display = 'block';
        resultElement.style.display = 'none';
    }

    // Show error if the given value cannot be converted
    // Else use the proper converter method based on the length of the number
    if (isNaN(parsedInput)) {
        showError('The given value cannot be converted!');
    } else {
        switch (true) {
            case (parsedInput < 0):
                showError('Number should be positive!');
                break;
            case (parsedInput >= 0 && parsedInput < 100):
                showValue(twoDigitsToText(parsedInput));
                break;
            case (parsedInput > 99 && parsedInput < 10000):
                showValue(fourDigitsToText(parsedInput));
                break;
            case (parsedInput > 9999 && parsedInput < 1000000):
                showValue(sixDigitsToText(parsedInput));
                break;
            case (parsedInput > 999999 && parsedInput < 10000000000):
                showValue(eightDigitsToText(parsedInput));
                break;
            default:
                showError('The given number is too high!');
        }
    }

    return true;
}