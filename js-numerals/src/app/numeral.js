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
}