module Enumerable
  # Your code goes here
  def my_each_with_index
    # returns an 'Enumerator' bound to this method if a block isn't given
    return to_enum(:my_each_with_index) unless block_given?

    index=0

    self.my_each do |element|
      yield [element, index]
      index+=1
    end
    
  end

  def my_all?
    self.my_each do |element|
      return false if yield(element)==false
    end

    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end

    false
    
  end

  def my_none?    
    val=true
    self.my_each do |element|
      val=false if yield(element) 
    end
    val
  end

  def my_count
    return self.length unless block_given?

    count=0
    self.my_each do |element|
      count+=1 if yield(element)
    end
    count
  end




end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    # returns an `Enumerator` bound to this method if a block isn't given
    return to_enum(:my_each) unless block_given?

    self.each do |elem|
      yield elem
    end

  end
end
