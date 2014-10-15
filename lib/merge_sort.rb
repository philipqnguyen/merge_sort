# Opens Array and add merge_sort
class Array
  def merge_sort
    master_arr = each_slice(2).to_a

    splitted_arr = master_arr.each do |arr|
      next if arr.size != 2 || arr[0] < arr[1]
      temp = arr[0]
      arr[0] = arr[1]
      arr[1] = temp
    end

    iterate splitted_arr
  end

  private

  def iterate(splitted_arr, i = 1)
    while splitted_arr.size > 1
      i = 1 if i >= splitted_arr.size

      merged = merge(splitted_arr[i - 1], splitted_arr[i])
      splitted_arr.delete_at i
      splitted_arr.delete_at i - 1
      splitted_arr.insert(i - 1, merged)
      i += 1
    end
    splitted_arr.flatten
  end

  def merge(left, right, result = [])
    if left.size > 0 && right.size > 0
      left[0] <= right[0] ? result << left.shift : result << right.shift
    else
      left.size > 0 ? result << left.shift : result << right.shift
    end

    return result if all_sorted?(left, right)
    merge(left, right, result)
  end

  def all_sorted?(left, right)
    if left.size == 0 && right.size == 0
      true
    else
      false
    end
  end
end
