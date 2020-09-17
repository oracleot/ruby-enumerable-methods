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
      my_each { |_class| return false unless _class.is_a? arg }
    elsif !arg.nil? && arg.is_a?(Integer)
      my_each { |_int| return false unless _int == arg }
    elsif !arg.nil? && arg.is_a?(String) || arg.is_a?(Regexp)
      my_each { |_str| return false unless _str.match(arg) }
    elsif !block_given?
      my_each { |res| return false if res.nil? || !res }
    else
      my_each { |res| return false unless yield(res) }
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

def multiply_els
  # Code here
end
