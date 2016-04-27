describe('numeral', function(){
	var inputElement;

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
	
});