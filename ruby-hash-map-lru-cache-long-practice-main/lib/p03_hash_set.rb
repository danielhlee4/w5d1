class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store[key.hash % num_buckets].include?(key.hash)
      @store[key.hash % num_buckets] << key.hash
      @count +=1
      if count > num_buckets
        resize!
      end
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key.hash)
  end

  def remove(key)
    if @store[key.hash % num_buckets].include?(key.hash)
      @store[key.hash % num_buckets].delete(key.hash)
      @count -= 1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
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