# A method named `binary_to_decimal` that receives as input an array of size 8.
# The array is randomly filled with 0’s and 1’s.
# The most significant bit is at index 0.
# The least significant bit is at index 7.
# Calculate  and return the decimal value for this binary number using
# the algorithm you devised in class.
def binary_to_decimal(binary_array)
  decimal = 0
  index = 0

  until index == binary_array.length
    power = (binary_array.length - 1) - index

    decimal += binary_array[index] * ( 2 ** (power))

    index += 1
  end

  return decimal
end


# Method named decimal_to_binary receives decimal number as input
# Calculates and returns the binary value as a number for the decimal number
def decimal_to_binary(decimal)
  binary = 0
  power = 0

  if decimal.class == Integer
    until decimal == 0
      binary_digit = decimal % 2
      binary += binary_digit * (10 ** power)

      decimal /= 2
      power += 1
    end

    return binary
  elsif decimal.class == Float
    decimal_before_dot = decimal - (decimal % 1)
    binary_before_dot = 0


    until decimal_before_dot == 0
      binary_digit = decimal_before_dot % 2
      binary_before_dot += binary_digit * (10 ** power)


      decimal_before_dot = (decimal_before_dot / 2)
      decimal_before_dot = decimal_before_dot - (decimal_before_dot % 1)

      power += 1
    end


    decimal_after_dot = (decimal % 1)
    binary_after_dot_string = "0."

    until decimal_after_dot == 0
      binary_digit = (decimal_after_dot * 2) - ((decimal_after_dot * 2) % 1)

      if binary_digit == 0
        binary_after_dot_string << "0"
      elsif binary_digit == 1
        binary_after_dot_string << "1"
      end

      decimal_after_dot = (decimal_after_dot * 2) % 1
    end

    binary_after_dot = binary_after_dot_string.to_f


    binary = binary_before_dot + binary_after_dot

    return binary
  else # if decimal input is not an integer or float
    raise ArgumentError, "Not a number."
  end

end