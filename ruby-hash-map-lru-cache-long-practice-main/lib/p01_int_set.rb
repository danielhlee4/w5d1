require "byebug"
class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    if num < 0 || num > max
      raise 'Out of bounds'
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !@store[num % num_buckets].include?(num)
      @store[num % num_buckets] << num
    end
  end

  def remove(num)
    if @store[num % num_buckets].include?(num)
      @store[num % num_buckets].delete(num)
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !@store[num % num_buckets].include?(num)
      @store[num % num_buckets] << num
      @count +=1
      if count > num_buckets
        resize!
      end
    end
  end

  def remove(num)
    if @store[num % num_buckets].include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private
  
  def num_buckets
    @store.length
  end
  
  def resize!(*args)
      # debugger
      nums = @store.flatten
      @store = Array.new(num_buckets * 2) { Array.new }
      @count = 0
      nums.each do |num|
        insert(num)
      end
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end
end