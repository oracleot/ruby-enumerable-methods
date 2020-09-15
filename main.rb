# rubocop:disable Style/CaseEquality

module Enumerable
  def my_each
    # 1. return enumerator if block is not given
    # 2. check the type of iterable provided and convert to array if not array - create a re-usable method for it
    # 3. loop through the array and yield each element
    # 4. return the array
  end

  def my_each_with_index
    # 1. return enumerator if block is not given
    # 2. check the type of iterable provided and convert to array if not array - use re-usable method for it
    # 3. loop through the array and yield each element and corresponding index
    # 4. return the array
  end

  def my_select
    # 1. return enumerator if block is not given
    # 2. create empty array to store the selected items
    # 3. using my_each, loop through the array and push the yielded items into new array
    # 4. return new array
  end

  def my_all?
    # your code here
  end

  def my_any?
    # your code here
  end

  def my_none?
    # your code here
  end

  def my_count
    # your code here
  end

  def my_map
    # your code here
  end

  def my_inject
    # your code here
  end

end

# rubocop:enable Style/CaseEquality

def multiply_els
  # your code here
end
