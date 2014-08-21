require "pry"

def decode(message)
  until message.split("").uniq == message.split("")
    letter_pair = find_letters(message)
    message = update_message(message, letter_pair)
  end
  message.gsub(/_(.*)/, "")
end

def update_message(message, index_array)
  character = message[index_array[0]]
  message.slice!(index_array[0])
  message.slice!(index_array[1] - 1)
  message << character
end

def find_letters(message)
  max_length = 0
  front_i = "?"
  back_i = "?"

  front = 0
  max = message.length
  while front < max
    back = max - 1
    while back > front
      if message[front] == message[back]
        temp_arr = message[(front + 1)...back].split("")
        if temp_arr.uniq == temp_arr && temp_arr.length > max_length
          front_i = front
          back_i = back
          max_length = temp_arr.length
        end
      end
      back -= 1
    end
    front += 1
  end
  [front_i, back_i]
end