require 'byebug'

class Luhn
  def self.valid? number
    clean_number = number.gsub(' ', '').reverse
    return false if clean_number.size <= 1 || clean_number.match(/\A[\d[:blank:]]+\z/).nil?
    double = clean_number
              .split('')
              .each_slice(2)
              .map(&:last)
              .map do |n| 
                r = n.to_i * 2
                r > 9? r -9 : r
              end
              .inject(:+)
    single = clean_number
              .split('')
              .each_slice(2)
              .map {|n| n.first.to_i}
              .inject(:+)
    ((double + single) % 10 == 0)
  end
end
