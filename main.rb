module Enumerable
  def my_each
    # Code here
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?
    my_iterable = enforce_arr
    arr_len = my_iterable.length
    arr_len.times do |index|
      yield(my_iterable[index], index)
    end
    my_iterable
  end

  def my_select
    # Code here
  end

  def my_all?
    # Code here
  end

  def my_any?
    # Code here
  end

  def my_none?
    # Code here
  end

  def my_count
    # Code here
  end

  def my_map
    # Code here
  end

  def my_inject
    # Code here
  end
end

def multiply_els
  # Code here
end
