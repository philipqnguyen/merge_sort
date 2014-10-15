# Opens Array and add merge_sort
class Array
  def merge_sort
    master_arr = each_slice(1).to_a

    iterate master_arr
  end

  private

  def iterate(master_arr, i = 1)
    while master_arr.size > 1
      i = 1 if i >= master_arr.size

      merged = merge(master_arr[i - 1], master_arr[i])
      master_arr.delete_at i
      master_arr.delete_at i - 1
      master_arr.insert(i - 1, merged)
      i += 1
    end
    master_arr.flatten
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
    left.size == 0 && right.size == 0 ? true : false
  end
end
