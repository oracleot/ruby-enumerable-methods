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
    return to_enum(__method__) unless block_given? || proc

    new_arr = []
    proc ? my_each { |i| new_arr << proc.call(i) } : my_each { |i| new_arr << yield(i) }
    new_arr
  end

  def my_inject(num = nil, sym = nil)
    if block_given?
      accumulator = num
      my_each do |item|
        accumulator = accumulator.nil? ? item : yield(accumulator, item)
      end
      accumulator
    elsif !num.nil? && (num.is_a?(Symbol) || num.is_a?(String))
      accumulator = nil
      my_each do |item|
        accumulator = accumulator.nil? ? item : accumulator.send(num, item)
      end
      accumulator
    elsif !sym.nil? && (sym.is_a?(Symbol) || sym.is_a?(String))
      accumulator = num
      my_each do |item|
        accumulator = accumulator.nil? ? item : accumulator.send(sym, item)
      end
      accumulator
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity

def multiply_els(iterable)
  iterable.my_inject(:*)
end

def enforce_arr
  arr = self if self.class == Array
  arr = to_a if self.class == Range
  arr = flatten if self.class == Hash
  arr
end
