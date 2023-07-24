class Integer
  # Integer#hash already implemented for you
  # def hash
  #   str = self.to_s(42)
  #   integer_hash = str.to_i(42)
  #   integer_hash
  # end
end

class Array
  def hash
    arr = []
    self.each_with_index do |el, i|
      arr << i
      arr << el
    end
  integ = arr.join("").to_i
  integ.hash
  end
end

class String
  def hash
    alpha = ("a".."z").to_a
    arr = []
    self.each_char.with_index do |char, i|
      arr << i
      arr << alpha.index(char)
    end
    # str = arr.join("").to_i
    # str.hash
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alpha = ("a".."z").to_a
    arr = []
    self.keys.sort.each do |key|
      arr << alpha.index(key.to_s)
      if self[key].is_a?(String)
        arr << alpha.index(self[key])
      else # it's an integer
        arr << self[key]
      end
    end
    arr.hash
    end
end