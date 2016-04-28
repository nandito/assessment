var words = {
	"0":"zero",
	"1":"one",
	"2":"two",
	"3":"three",
	"4":"four",
	"5":"five",
	"6":"six",
	"7":"seven",
	"8":"eight",
	"9":"nine",
	"10":"ten",
	"11":"eleven",
	"12":"twelve",
	"13":"thirteen",
	"14":"fourteen",
	"15":"fifteen",
	"16":"sixteen",
	"17":"seventeen",
	"18":"eighteen",
	"19":"nineteen",
	"20":"twenty",
	"30":"thirty",
	"40":"forty",
	"50":"fifty",
	"60":"sixty",
	"70":"seventy",
	"80":"eighty",
	"90":"ninety"
};

function numeral(){
	var inputNumber = document.getElementById("inputNumber").value;
	return inputNumber;
};

function twoDigitsToText(number){
	if (number < 21)
		return(words[number])
	else {
		var lastDigit, teens, lastDigitAsText, teensAsText;
		
		lastDigit = number % 10;
		if (lastDigit === 0)
			lastDigitAsText = ''
		else {
			lastDigitAsText = '-' + words[lastDigit]
		};
		
		teens = number - lastDigit;
		teensAsText = words[teens];
		
		return teensAsText + lastDigitAsText;
	}
};

function fourDigitsToText(number){
	var teens, hundreds, teensAsText, hundredsAsText;
	
	teens = number % 100;
	if (teens === 0){
		teensAsText = ''
	}
	else {
		teensAsText = ' and ' + twoDigitsToText(teens)
	};
	
	hundreds = (number-teens) / 100;
	if (hundreds % 10 === 0){
		hundredsAsText = twoDigitsToText(hundreds / 10) + ' thousand'
	}
	else {
		hundredsAsText = twoDigitsToText(hundreds) + ' hundred'
	};
	
	return hundredsAsText + teensAsText;
};

function sixDigitsToText(number){
	var hundreds, thousands, hundredsAsText, thousandsAsTexts;
	
	hundreds = number % 1000;
	thousands = (number - hundreds) / 1000;
	
	if (thousands > 99){
		thousandsAsTexts = fourDigitsToText(thousands) + ' thousand'
	}
	else {
		thousandsAsTexts = twoDigitsToText(thousands) + ' thousand'
	};
	
	if (hundreds === 0){
		hundredsAsText = '';
	}
	else {
		if (hundreds > 99){
			hundredsAsText = ' and ' + fourDigitsToText(hundreds);
		}
		else {
			hundredsAsText = ' and ' + twoDigitsToText(hundreds);
		}
	};
	
	return thousandsAsTexts + hundredsAsText;
};

function eightDigitsToText(number){
	var millions, underMillion, millionsAsText, underMillionAsText;
	
	underMillion = number % 1000000
	millions = (number - underMillion) / 1000000;
	
	if (millions > 99){
		millionsAsText = fourDigitsToText(millions) + ' million'
	}
	else {
		millionsAsText = twoDigitsToText(millions) + ' million'
	};
	
	if (underMillion === 0){
		underMillionAsText = '';
	}
	else {
		underMillionAsText = ' and ' + sixDigitsToText(underMillion);
	};
	
	return millionsAsText + underMillionAsText;
};