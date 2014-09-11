START_I = 0
END_I = 1
CHAR_I = 2
SHRINK_I = 3
VALID_I = 4

def decode(message)
  intervals = get_intervals(get_char_positions(message))

  until intervals.empty?
    validate_intervals(intervals)
    max_interval = get_max_interval(intervals)
    message[max_interval[START_I]] = message[max_interval[END_I]] = "*"
    message << max_interval[CHAR_I]
    clean_intervals(intervals, max_interval, message)
  end

  message.gsub!("*", "")
  message.gsub!(/_(.*)/, "")
  message
end

def clean_intervals(intervals, max_interval, message)
  intervals.delete(max_interval)
  intervals.each do |interval|
    unless move_interval(max_interval, interval, message)
      adjust_for_shrinkage(max_interval, interval)
    end
  end
  intervals.sort!.uniq!
end

def adjust_for_shrinkage(max_interval, interval)
  if contains(interval, max_interval) # interval contains max_interval
    interval[SHRINK_I] += 2
  elsif overlaps(interval, max_interval)
    interval[SHRINK_I] += 1
  end
end

def move_interval(max_interval, interval, message)
  if interval[START_I] == max_interval[START_I] || interval[START_I] == max_interval[END_I]
    interval[START_I]  =  interval[END_I]
    moved              =  true
  else
    moved = interval[END_I] == max_interval[END_I] || interval[END_I] == max_interval[START_I]
  end

  if moved
    interval[END_I]    =  message.length - 1
    interval[VALID_I]  =  false
    interval[SHRINK_I] =  message[interval[START_I]..interval[END_I]].count("*")
  end
  moved
end

def get_max_interval(intervals)
  max_length = 0
  max_interval = nil
  intervals.each do |interval|
    if interval[VALID_I]
      length = interval[END_I] - interval[START_I] - interval[SHRINK_I]
      if length > max_length
        max_length = length
        max_interval = interval
      end
    end
  end
  max_interval
end

def get_char_positions(string)
  positions = {}
  string.split("").each_with_index do |char, i|
    unless positions[char]
      positions[char] = []
    end
    positions[char] << i
  end
  positions
end

def get_intervals(char_positions)
  intervals = []
  char_positions.each do |char, index_array|
    get_combos(index_array).each do |interval|
      intervals << interval + [char, 0, false]
    end
  end
  intervals.sort
end

def get_combos(array)
  combos = []
  array.each_with_index do |start_i, i|
    array[i+1..-1].each do |end_i|
      combos << [start_i, end_i]
    end 
  end
  combos
end

def validate_intervals(intervals)
  intervals.each_with_index do |outer, i|
    if !outer[VALID_I]
      valid = true
      intervals[i+1..-1].each do |inner|
        if contains(outer, inner)
          valid = false
          break
        end
      end

      if valid
        outer[VALID_I] = true
      end
    end
  end
end

# contains([1, 5], [2, 3]) is true
# contains([1, 5], [2, 9]) is false
def contains(outer, inner)
  outer[0] < inner[0] && inner[1] < outer[1]
end 

# overlaps([1, 5], [0, 3]) is true
def overlaps(interval_a, interval_b)
  if interval_a[0] > interval_b[0]
    interval_a, interval_b = interval_b, interval_a
  end
  interval_a[0] < interval_b[1] && interval_a[1] > interval_b[0]
end
