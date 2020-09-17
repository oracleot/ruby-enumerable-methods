# rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity

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

# rubocop:enable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity

def multiply_els
  # Code here
end
