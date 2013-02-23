

arr1 = [
  [39, 43, 49, 29, 18],
  [30, 47, 24, 29, 15],
  [49, 50, 39, 20, 33],
  [18, 38, 35, 32, 35],
  [29, 44, 18, 34, 44]
]
arr2 = [
  [50, 27, 36, 43, 39],
  [36, 14, 35, 40, 19],
  [20, 33, 48, 32, 40],
  [41, 40, 15, 22, 19],
  [21, 24, 24, 31, 18]
]
arr3 = [
  [39, 43, 49, 29, 18],
  [30, 47, 24, 29, 15],
  [49, 50, 39, 20, 33],
  [18, 38, 35, 32, 38],
  [29, 44, 18, 34, 44]
]
arr4 = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

def find_all_indices(arr, value)
  indices = []
  arr.each_index { |e|
    if arr[e] == value
      indices << e
    end
  }
  indices
end

def find_possible_row_points(arr)
  possible_row_points = arr.map { |a|
    current_max = a.max
    indices = find_all_indices(a, current_max)
    [current_max, indices]
  }
end

def find_possible_column_points(arr)
  possible_column_points = []
  l = arr.length - 1
  0.upto(l).each do |ind|
    column_arr = []
    arr.each do |a|
      column_arr << a[ind]
    end
    current_min = column_arr.min
    indices = find_all_indices(column_arr, current_min)
    possible_column_points << [current_min, indices]
  end
  possible_column_points
end

def find_saddle_points(row_points, column_points)
  sp = []
  row_points.each { |val, points|
    points.each do |p|
      if column_points[p][0] == val
        sp << [(column_points[p][1][0] + 1), (p + 1)] #adding 1 to make it indexed one, instead of zero
      end
    end
  }
  sp.empty? ? "No saddle points found." : sp
end

current_arr = arr1
puts find_saddle_points(find_possible_row_points(current_arr), find_possible_column_points(current_arr)).inspect

