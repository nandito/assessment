describe('numeral.js', function(){
	var inputElement, testNumber;

	beforeEach(function() {
		inputElement = document.createElement('input');
		inputElement.setAttribute("id", "inputNumber");
	});
	
	it('should have a numeral method', function(){
		document.getElementById = jasmine.createSpy('HTML Element').and.returnValue(inputElement);
		console.log(document.getElementById);
		
		var testMethod = numeral();
		expect(document.getElementById).toHaveBeenCalled();
		
		expect(testMethod).toBe('');
	});
	
	it('should return two digit number as text', function(){
		expect(twoDigitsToText(0)).toBe('zero');
		expect(twoDigitsToText(5)).toBe('five');
		expect(twoDigitsToText(15)).toBe('fifteen');
		expect(twoDigitsToText(20)).toBe('twenty');
		expect(twoDigitsToText(21)).toBe('twenty-one');
		expect(twoDigitsToText(50)).toBe('fifty');
		expect(twoDigitsToText(88)).toBe('eighty-eight');
	});
	
	it('should return four digit number as text', function(){
		expect(fourDigitsToText(100)).toBe('one hundred');
		expect(fourDigitsToText(310)).toBe('three hundred and ten');
		expect(fourDigitsToText(555)).toBe('five hundred and fifty-five');
		expect(fourDigitsToText(1000)).toBe('one thousand');
		expect(fourDigitsToText(1999)).toBe('nineteen hundred and ninety-nine');
		expect(fourDigitsToText(2001)).toBe('two thousand and one');
		expect(fourDigitsToText(2222)).toBe('twenty-two hundred and twenty-two');
	});
	
});