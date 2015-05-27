def encrypt(text, key)
    key = key.to_i
    encrypted_text = ""

    text.each_char do |char|
        if char.match(/[[:alpha:]]/)
            encrypted_text << shift_character(char, key)
        else
            encrypted_text << char
        end
    end

    encrypted_text
end

def shift_character(char, shift_factor)
    char_value = char.ord
    # first and last character ordinates, assuming char is lowercase
    wrap_start, wrap_end = "a".ord, "z".ord
    # reassign first, last char ordinates if char is uppercase
    wrap_start, wrap_end = "A".ord, "Z".ord if char.match(/[[:upper:]]/)

    if shift_factor < 0
        # remove unnecessary iterations using modulo
        shift_factor = shift_factor % -26
        while shift_factor != 0 do
            char_value == wrap_start ? char_value = wrap_end : char_value -= 1
            shift_factor += 1
        end
    else
        shift_factor = shift_factor % 26
        while shift_factor != 0 do
            char_value == wrap_end ? char_value = wrap_start : char_value += 1
            shift_factor -= 1
        end
    end

    char_value.chr
end


puts encrypt("Nothing to see here. The password is 2099", 100.323491930921)
puts encrypt("x y.z!", 00)
puts encrypt("X Y.Z!", 100)
puts encrypt("Nothing to see here. The password is 2099", -100)
puts encrypt("a b.c!", -100)
puts encrypt("A B.C!", -100)
