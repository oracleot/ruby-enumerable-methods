require './main.rb'

describe Enumerable do
  let(:friends) { %w[Sharon Leo Leila Brian Arun] }
  let(:friends_ages) { [12, 28, 17, 30, 43, 37, 23] }
  let(:age_range) { (12..43) }
  let(:partners) { { 'Dami' => 31, 'Ntwali' => 23, 'Mahanta' => 28, 'Sine' => 26 } }
  let(:empty_array) { [] }
  let(:nil_true) { [nil, true, 99] }
  let(:str_num) { ['Daniel', 50, 3.5] }
  let(:float_nums) { [2.5, 5, 5.6] }
  let(:zero_nums) { [0, 0, 0, 0, 0, 2, 54, 34, 0] }
  let(:nil_false) { [nil, false] }
  let(:proc) { Proc.new { |i| i**3 } }

  describe '#my_each' do
    it 'returns each individual element of an array of strings' do
      expect(friends.my_each { |friend| puts friend }).to eql(friends.each { |friend| puts friend })
    end
    it 'returns each individual element of an array of integers' do
      expect(friends_ages.my_each { |age| puts age }).to eql(friends_ages.each { |age| puts age })
    end
    it 'returns each individual element of a range' do
      expect(age_range.my_each { |age| puts age }).to eql(age_range.each { |age| puts age })
    end
    it 'returns each individual element and the corresponding key of a hash' do
      expect(partners.my_each { |partner| puts partner }).to eql(partners.each { |partner| puts partner })
    end
    it 'returns nothing' do
      expect(empty_array.my_each { |arr| puts arr }).to eql(empty_array.each { |arr| puts arr })
    end
    it 'returns an enumerator when no block is given' do
      expect(age_range.my_each).to be_a(Enumerator)
    end
  end
  describe '#my_each_with_index' do
    it 'returns each individual element of an array of strings' do
      expect(friends.my_each_with_index { |friend, index| puts "#{friend}: #{index}" }).to eql(friends.each_with_index { |friend, index| puts "#{friend}: #{index}" })
    end
    it 'returns each individual element of an array of integers' do
      expect(friends_ages.my_each_with_index { |age, index| puts "#{age}: #{index}" }).to eql(friends_ages.each_with_index { |age, index| puts "#{age}: #{index}" })
    end
    it 'returns each individual element of a range' do
      expect(age_range.my_each_with_index { |age, index| puts "#{age}: #{index}" }).to eql(age_range.each_with_index { |age, index| puts "#{age}: #{index}" })
    end
    it 'returns each individual element and the corresponding key of a hash' do
      expect(partners.my_each_with_index { |partner, index| puts "#{partner}: #{index}" }).to eql(partners.each_with_index { |partner, index| puts "#{partner}: #{index}" })
    end
    it 'returns nothing' do
      expect(empty_array.my_each_with_index { |arr, index| puts "#{arr}: #{index}" }).to eql(empty_array.each_with_index { |arr, index| puts "#{arr}: #{index}" })
    end
    it 'returns an enumerator when no block is given' do
      expect(age_range.my_each_with_index).to be_a(Enumerator)
    end
  end
  describe '#my_select' do
    it 'returns selected elements in an array of strings' do
      expect(friends.my_select { |friend| friend != 'Brian' }).to eql(friends.reject { |friend| friend == 'Brian' })
    end
    it 'returns selected elements in an array of integers' do
      expect(friends_ages.my_select { |age| age > 17 }).to eql(friends_ages.select { |age| age > 17 })
    end
    it 'returns selected elements of a range' do
      expect(age_range.my_select { |age| age > 17 }).to eql(age_range.select { |age| age > 17 })
    end
    it 'returns nothing' do
      expect(empty_array.my_select { |arr| arr != 'Brian' }).to eql(empty_array.reject { |arr| arr == 'Brian' })
    end
    it 'returns an enumerator when no block is given' do
      expect(age_range.my_select).to be_a(Enumerator)
    end
  end
  describe '#my_all' do
    it 'returns false if not all elements in an array of strings meet a certain condition' do
      expect(friends.my_all? { |friend| friend.length > 4 }).to be false
    end
    it 'returns true if all elements in an array of integers meet a certain condition' do
      expect(friends_ages.my_all? { |age| age > 10 }).to be true
    end
    it 'returns false if not all elements within a range meet a certain condition' do
      expect(nil_true.my_all?).to be false
    end
    it 'returns true if array is empty' do
      expect(empty_array.my_all? { |arr_item| arr_item > 10 }).to be true
    end
    it 'It returns true if no block is given' do
      expect(friends.my_all?).to be true
    end
  end
  describe '#my_any' do
    it 'returns true if one element in an array of strings meet a certain condition' do
      expect(friends.my_any? { |friend| friend.length > 4 }).to be true
    end
    it 'returns true if one element in an array of integers meet a certain condition' do
      expect(friends_ages.my_any?(Integer)).to be true
    end
    it 'returns true if one element within a range meet a certain condition' do
      expect(age_range.my_any? { |age| age > 17 }).to be true
    end
    it 'returns false if array is empty' do
      expect(empty_array.my_any? { |arr_item| arr_item > 10 }).to be false
    end
    it 'It returns true if no block is given' do
      expect(friends.my_any?).to be true
    end
  end
  describe '#my_none' do
    it 'returns false if not all elements in an array of strings do not meet a certain condition' do
      expect(friends.my_none? { |friend| friend.length > 4 }).to be false
    end
    it 'returns false if all elements in an array of integers meet a certain condition' do
      expect(friends_ages.my_none? { |age| age > 10 }).to be false
    end
    it 'returns true if all elements within a range do not meet a certain condition' do
      expect(age_range.my_none? { |age| age < 10 }).to be true
    end
    it 'returns true if array is empty' do
      expect(empty_array.my_none? { |arr_item| arr_item > 10 }).to be true
    end
    it 'It returns false if no block is given' do
      expect(friends.my_none?).to be false
    end
    it 'It returns true if all elements return false' do
      expect(nil_false.my_none?).to be true
    end
  end
  describe '#my_count' do
    it 'returns the length of the array' do
      expect(friends.my_count).to eql(friends.count)
    end
    it 'returns number of elements corresponding to the argument' do
      expect(friends_ages.my_count(12)).to eql(friends_ages.count(12))
    end
    it 'returns number of elements meeting the condition when a block is given' do
      expect(friends_ages.my_count { |i| i % 12 == 0 }).to eql(friends_ages.count { |i| i % 12 == 0 })
    end
  end
  describe '#my_map' do
    it 'returns a new array with the results of the running block once for every element in enum' do
      expect(friends_ages.my_map(&proc)).to eql(friends_ages.map(&proc))
    end
    it 'returns a new array with the results of the running block once for every element in a range' do
      expect(age_range.my_map { |i| i**2 }).to eql(age_range.map { |i| i**2 })
    end
    it 'returns an Enumerator when no block is given' do
      expect(friends_ages.my_map).to be_a(Enumerator)
    end
  end

  describe '#my_inject' do
    it 'returns amount using the symbol in the parameter as mathematical operator' do
      expect(friends_ages.my_inject(:+)).to eql(190)
    end

    it 'returns sum of numbers in the array using the first parameter as accumulator' do
      expect(friends_ages.my_inject(2, :+)).to eql(192)
    end

    it 'returns the instructions specified in the block' do
      expect(friends_ages.my_inject { |acc, value| acc + value }).to eql(friends_ages.inject { |acc, value| acc + value })
    end

    it 'returns the instructions specified in the block using the parameter as an accumulator' do
      expect(friends_ages.my_inject(2) { |acc, value| acc + value }).to eql(friends_ages.inject(2) { |acc, value| acc + value })
    end

    it 'returns the longest word' do
      expect(friends.my_inject { |memo, word| memo.length > word.length ? memo : word }).to eql(friends.inject { |memo, word| memo.length > word.length ? memo : word })
    end
  end
end

describe '#multiply_els' do
  let(:arr) { [2, 4, 5] }
  let(:result) { 40 }

  it 'returns the accumulator of each element multipled' do
    expect(multiply_els(arr)).to eql(result)
  end
end
