# leetcode 681
def next_closest_time(time)
  time = format_time(time)
  digits = sorted_digits(time)
  new_time = time
  return new_time if fix_minute_last(new_time, digits)
  return new_time if fix_minute_first(new_time, digits)
  return new_time if fix_hour_last(new_time, digits)
  return new_time if fix_hour_first(new_time, digits)
  new_time
end

module TimeIndex
  MINUTE_LAST  = 4
  MINUTE_FIRST = 3
  HOUR_LAST    = 1
  HOUR_FIRST   = 0
end

def fix_hour_first(new_time, digits)
  fix_time_position(new_time, TimeIndex::HOUR_FIRST, 2, digits)
end

def fix_hour_last(new_time, digits)
  digit = greater_than(new_time[1].to_i, digits)
  if ((digit != nil) && [0, 1].include?(new_time[0].to_i) && (0 <= digit) && (digit <= 9))
    new_time[TimeIndex::HOUR_LAST] = digit.to_s
    true
  elsif ((digit != nil) && (new_time[0].to_i == 2) && (0 <= digit) && (digit <= 3))
    new_time[TimeIndex::HOUR_LAST] = digit.to_s
    true
  else
    new_time[TimeIndex::HOUR_LAST] = digits.first.to_s
    false
  end
end

def fix_minute_first(new_time, digits)
  fix_time_position(new_time, TimeIndex::MINUTE_FIRST, 5, digits)
end

def fix_minute_last(new_time, digits)
  fix_time_position(new_time, TimeIndex::MINUTE_LAST, 9, digits)
end

def fix_time_position(new_time, index, max_value, digits)
  digit = greater_than(new_time[index].to_i, digits)
  if ((digit != nil) && (0 <= digit) && (digit <= max_value))
    new_time[index] = digit.to_s
    true
  else
    new_time[index] = digits.first.to_s
    false
  end
end

def greater_than(elem, digits)
  result = nil
  digits.each do |x|
    if elem < x
      result = x 
      break
    end
  end
  result
end

def format_time(time)
  first_part, last_part = time.split(":")
  first_part = '0' + first_part if first_part.size == 1
  last_part  = '0' + last_part  if last_part.size == 1
  first_part + ":" + last_part
end

def sorted_digits(time)
  arr = []
  time.chars.each do |c|
    arr << c.to_i if c != ':'
  end
  arr.sort.uniq
end
