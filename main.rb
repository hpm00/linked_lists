class Node
  
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end 
  
end
------------------------------------------------------------------------------
class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end 

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end 

  def append(value)
    node = create_node(value)
    
    if @head.nil?
      @head = node
      @tail = node
    else 
      @tail.next_node = node
      @tail = node
    end
  
  end 

  def prepend(value)
    node = create_node(value)

    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end 

  def size(node = @head, counter = 1)

    if node.nil?
      return 0
    elsif node.next_node.nil?
      return counter
    else 
      return size(node.next_node, counter + 1)
    end
    
  end

  def head
  end

  def tail 
    return node if node.next_node.nil?
    tail(node.next_node)
  end 

  def at(node = @head, index)
    index.times do 
      node = node.next_node
    end
    node
  end

  def pop(node = @head)
    if node.next_node.next_node.nil?
      node.next_node = nil
      @tail = node
    else
      pop(node.next_node)
    end
  end
  

end