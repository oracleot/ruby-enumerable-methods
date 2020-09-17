# rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity

module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?

    my_iterable = enforce_arr
    arr_len = my_iterable.length
    arr_len.times do |index|
      yield(my_iterable[index])
    end
    my_iterable
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
    return to_enum(:my_select) unless block_given?

    new_arr = []
    my_each { |item| new_arr << item if yield(item) }
    new_arr
  end

  def my_all?(arg = nil)
    if !arg.nil? && arg.is_a?(Class)
      my_each { |block| return false unless block.is_a? arg }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |block| return false unless block == arg }
    elsif !arg.nil? && arg.is_a?(String) || arg.is_a?(Regexp)
      my_each { |block| return false unless block.match(arg) }
    elsif !block_given?
      my_each { |block| return false if block.nil? || !block }
    else
      my_each { |block| return false unless yield(block) }
    end
    true
  end

  def my_any?
    if !arg.nil? && arg.is_a?(Class)
      my_each { |block| return true if block.is_a? arg }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |block| return true if block == arg }
    elsif !arg.nil? && arg.is_a?(String) || arg.is_a?(Regexp)
      my_each { |block| return true if block.match(arg) }
    elsif !block_given?
      my_each { |block| return true unless block.nil? || !block }
    else
      my_each { |block| return true if yield(block) }
    end
    false
  end

  def my_none?
    if !arg.nil? && arg.is_a?(Class)
      my_each { |block| return false if block.is_a? arg }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |block| return false if block == arg }
    elsif !arg.nil? && arg.is_a?(String) || arg.is_a?(Regexp)
      my_each { |block| return false if block.match(arg) }
    elsif !block_given?
      my_each { |block| return false unless block.nil? || !block }
    else
      my_each { |block| return false if yield(block) }
    end
    true
  end

  def my_count(count = nil)
    my_iterable = enforce_arr
    return my_iterable.length unless block_given? || count
    return my_iterable.my_select { |block| block == count }.length if count
    my_iterable.my_select { |block| yield(block) }.length
  end

  def my_map
    # Code here
  end

  def my_inject
    # Code here
  end
end

# rubocop:enable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity

def multiply_els
  # Code here
end
