require 'spec_helper'
require 'merge_sort.rb'

describe 'Merge sort' do
  it 'should sort a randomly ordered array into a sorted array' do
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle

    arr.merge_sort.must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  it 'should sort large numbers' do
    arr = [2, 7, 22, 33, 11, 4, 1, 21, 9, 89, 99]

    arr.merge_sort.must_equal arr.sort
  end

  it 'should sort a huge list of numbers' do
    arr = (1..100).to_a.shuffle

    arr.merge_sort.must_equal arr.sort
  end
end

describe 'Merge Sort Benchmark' do
  bench_performance_linear 'random numbers', 0 do
    arr = (1..10).to_a.shuffle
    100.times do
      arr.merge_sort
    end
  end

  bench_performance_linear 'almost sorted', 0 do
    arr = [1, 2, 4, 3, 5, 6, 7, 9, 8]
    100.times do
      arr.merge_sort
    end
  end

  bench_performance_linear 'reversed numbers', 0 do
    arr = [9, 8, 7, 6, 5, 4, 3, 2, 1]
    100.times do
      arr.merge_sort
    end
  end
end
