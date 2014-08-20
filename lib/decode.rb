require "pry"

def decode(string)
  modified_message = re_move_chars(string)
  modified_message.gsub(/_(.*)/, "")
end

def re_move_chars(message)
  left_i = 0
  max = message.length
  while left_i < max
    current_character = message[left_i]
    right_i = max - 1
    while right_i > left_i
      if current_character == message[right_i]
        temp_arr = message[(left_i + 1)...right_i].split("")
        if temp_arr.uniq == temp_arr # if there are no repeating characters
          message.slice!(left_i) # remove left character
          message.slice!(right_i - 1) # remove right character
          message << current_character # push character onto the end of the string
          return re_move_chars(message)
        end
      end
      right_i -= 1
    end
    left_i += 1
  end
  message
end
