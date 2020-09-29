require './main.rb'

describe Enumerable do
    let(:friends) {%w[Sharon Leo Leila Brian Arun]}
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

    let(:result) { [] }
    let(:actual) { [] }
    describe "#my_each" do
        it "returns each individual element of an array of strings" do
            expect(friends.my_each { |friend| puts friend }).to eql(friends.each { |friend| puts friend }) 
        end

        it "returns each individual element of an array of integers" do
            expect(friends_ages.my_each { |age| puts age }).to eql(friends_ages.each { |age| puts age }) 
        end

        it "returns each individual element of a range" do
            expect(age_range.my_each { |age| puts age }).to eql(age_range.each { |age| puts age }) 
        end

        it "returns each individual element and the corresponding key of a hash" do
            expect(partners.my_each { |partner| puts partner }).to eql(partners.each { |partner| puts partner }) 
        end

        it "returns nothing" do
            expect(empty_array.my_each { |arr| puts arr }).to eql(empty_array.each { |arr| puts arr }) 
        end

        it "returns an enumerator when no block is given" do
            expect(age_range.my_each).to be_a(Enumerator) 
        end
    end
end


# def test_my_each
#     # https://ruby-doc.org/core-2.6.5/Enumerable.html#method-i-each_entry
#     puts '1.'
#     puts '-- Using each_entry:'
#     p %w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }
#     puts "\n-- Using my_each:"
#     p %w[Sharon Leo Leila Brian Arun].each_entry { |friend| puts friend }
#   end
  