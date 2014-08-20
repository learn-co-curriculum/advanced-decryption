require "pry"

def decode(string)
  modified_message = re_move_chars(string)
  modified_message.gsub(/_(.*)/, "")
end

def re_move_chars(message)
  left = 0
  max = message.length
  right = max - 1
  while left < max && right > left
    current_character = message[left]

    if current_character == message[right]
      temp_arr = message[(left + 1)...right].split("")
      if temp_arr.uniq == temp_arr # if there are no repeating characters
        [left, right].each {|index| message.slice!(index) } # remove both characters
        message << current_character # push character onto the end of the string
        re_move_chars(message)
      end
    end

    left += 1
    right -= 1
  end
  message
end