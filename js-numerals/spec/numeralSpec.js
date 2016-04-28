describe('numeral.js', function () {
    'use strict';
    var inputElement;

    beforeEach(function () {
        inputElement = document.createElement('input');
        inputElement.setAttribute("id", "inputNumber");
    });

    it('should have a numeral method', function () {
        document.getElementById = jasmine.createSpy('HTML Element').and.returnValue(inputElement);
        expect(numeral()).toBe(true);
        expect(document.getElementById).toHaveBeenCalled();
    });

    it('should return two digit number as text', function () {
        expect(twoDigitsToText(0)).toBe('zero');
        expect(twoDigitsToText(5)).toBe('five');
        expect(twoDigitsToText(15)).toBe('fifteen');
        expect(twoDigitsToText(20)).toBe('twenty');
        expect(twoDigitsToText(21)).toBe('twenty-one');
        expect(twoDigitsToText(50)).toBe('fifty');
        expect(twoDigitsToText(88)).toBe('eighty-eight');
    });

    it('should return four digit number as text', function () {
        expect(fourDigitsToText(100)).toBe('one hundred');
        expect(fourDigitsToText(310)).toBe('three hundred and ten');
        expect(fourDigitsToText(555)).toBe('five hundred and fifty-five');
        expect(fourDigitsToText(1000)).toBe('one thousand');
        expect(fourDigitsToText(1999)).toBe('nineteen hundred and ninety-nine');
        expect(fourDigitsToText(2001)).toBe('two thousand and one');
        expect(fourDigitsToText(2222)).toBe('twenty-two hundred and twenty-two');
    });

    it('should return six digit number as text', function () {
        expect(sixDigitsToText(10000)).toBe('ten thousand');
        expect(sixDigitsToText(23442)).toBe('twenty-three thousand and four hundred and forty-two');
        expect(sixDigitsToText(200000)).toBe('two hundred thousand');
        expect(sixDigitsToText(654010)).toBe('six hundred and fifty-four thousand and ten');
        expect(sixDigitsToText(999999)).toBe('nine hundred and ninety-nine thousand and nine hundred and ninety-nine');
    });

    it('should return eight digit number as text', function () {
        expect(eightDigitsToText(1000000)).toBe('one million');
        expect(eightDigitsToText(60000000)).toBe('sixty million');
        expect(eightDigitsToText(234567890)).toBe('two hundred and thirty-four million and five hundred and sixty-seven thousand and eight hundred and ninety');
    });
});