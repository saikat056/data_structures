# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  rec1 = [a,b,c,d]
  rec2 = [e,f,g,h]
  return area_for(rec1) + area_for(rec2) - common_area_for(rec1, rec2)
end

def area_for(rec)
  area = (rec[0] - rec[2]) * (rec[1] - rec[3])
  area *= -1 if area < 0
  area
end

def common_area_for(rec1, rec2)
  return 0 if !is_rectangle_overlap(rec1, rec2)
  x_arr = [rec1[0], rec1[2], rec2[0], rec2[2]]
  y_arr = [rec1[1], rec1[3], rec2[1], rec2[3]]
  x_arr = extract_middle_points(x_arr)
  y_arr = extract_middle_points(y_arr)
  area_for([x_arr[0], y_arr[0], x_arr[1], y_arr[1]])
end

def extract_middle_points(arr)
  arr = arr.sort
  arr.shift
  arr.pop
  arr
end

def is_rectangle_overlap(rec1, rec2)
  x1 = rec1[0]
  y1 = rec1[1]
  x2 = rec1[2]
  y2 = rec1[3]
  p1 = rec2[0]
  q1 = rec2[1]
  p2 = rec2[2]
  q2 = rec2[3]
  return false if out_of_range_rec(x1, x2, p1, p2) || out_of_range_rec(y1, y2, q1, q2)
  return false if point_touched(x1, x2, p1, p2) || point_touched(y1, y2, q1, q2)
  return true
end


def out_of_range(start_point, end_point, current_point)
  !(start_point <= current_point && current_point <= end_point)
end

def out_of_range_rec(a, b, c, d)
  out_of_range(a, b, c) && out_of_range(a, b, d) && out_of_range(c, d, a) && out_of_range(c, d, b)
end

def point_touched(a, b, c, d)
  b == c || d == a
end
