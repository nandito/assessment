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
	
});