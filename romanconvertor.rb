def fromRoman(romanNumber)
    regular_digits = {
        "I": 1, 
        "V": 5, 
        "X": 10, 
        "L": 50, 
        "C": 100, 
        "D": 500, 
        "M": 1000
    }
    subtraction_digits = {
        "IV": 4, 
        "IX": 10, 
        "XL": 40, 
        "XC": 90, 
        "CD": 400, 
        "CM": 900
    }
    arabicNumber = 0
    
    digits = romanNumber.split('')
    while !digits.empty? do
        # Start 'consuming' digits
        # Test for subtraction digits first
        current_digit = digits[0].dup
        if digits.length >= 2
            current_digit << digits[1]
        end

        # if (!regular_digits.has_key?(digit) && !subtraction_digits.has_key?(digit))
        #     raise TypeError
        # end
        # }

        current_digit = current_digit.to_sym
        if subtraction_digits.has_key?(current_digit)
            digits.shift
            digits.shift
            arabicNumber += subtraction_digits[current_digit]
        else
            # The first digit is not a subtraction digit
            current_digit = digits[0]
            current_digit = current_digit.to_sym
            digits.shift
            arabicNumber += regular_digits[current_digit]
        end
    end

    return arabicNumber
end



def toRoman(arabicNumber)
    # verify arabic Number is valid
    if arabicNumber>3999 || arabicNumber < 1
        raise RangeError
        return
    end

    # Greedily subtract values corresponding to 
    # roman numerals from the arabicNumber. 
    # For each success, append the roman numeral
    # to romNum
    romNum = ""
    while arabicNumber > 0 do
        if arabicNumber - 1000 >= 0
            romNum << "M"
            arabicNumber -= 1000
        elsif arabicNumber - 900 >= 0
            romNum << "CM"
            arabicNumber -= 900
        elsif arabicNumber - 500 >= 0
            romNum << "D"
            arabicNumber -= 500
        elsif arabicNumber - 400 >= 0
            romNum << "CD"
            arabicNumber -= 400
        elsif arabicNumber - 100 >= 0
            romNum << "C"
            arabicNumber -= 100
        elsif arabicNumber - 90 >= 0
            romNum << "XC"
            arabicNumber -= 90
        elsif arabicNumber - 50 >= 0
            romNum << "L"
            arabicNumber -= 50
        elsif arabicNumber - 40 >= 0
            romNum << "XL"
            arabicNumber -= 40
        elsif arabicNumber - 10 >= 0  
            romNum << "X"
            arabicNumber -= 10
        elsif arabicNumber == 9
            romNum << "IX"
            arabicNumber -= 9
        elsif arabicNumber - 5 >= 0 
            romNum << "V"
            arabicNumber -= 5
        elsif arabicNumber == 4
            romNum << "IV"
            arabicNumber -= 4
        else
            romNum << "I"
            arabicNumber -= 1
        end
    end

    return romNum
end