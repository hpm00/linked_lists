class Node
  
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end 
  
end
------------------------------------------------------------------------------
class LinkedList

  # assigns initial value of nil to head and tail of Linked List
  def initialize
    @head = nil
    @tail = nil
  end 

  # creates a new node (value is data node contains) (next_node is
  # reference to next node (its neighbor))
  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end 

  # creates new node with value specified and adds to end of list
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

  # creates new node with value specified and adds to front of list
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

  # returns size (amt of nodes) of list
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

  # returns tail of list
  def tail 
    return node if node.next_node.nil?
    tail(node.next_node)
  end 

  # returns node at specified index or nil 
  def at(node = @head, index)
    index.times do 
      node = node.next_node
      return nil if index > size(node = @head, counter = 1)
    end
    node
  end

  # removes last node of list
  def pop(node = @head)
    if node.next_node.next_node.nil?
      node.next_node = nil
      @tail = node
    else
      pop(node.next_node)
    end
  end

  # returns true or false 
  def contains?(value)
    node = @head
    until node.nil? 
       return true if node.value == value
       node = node.next_node
    end 
    false
  end

  # locates node with value specified, returns node's index
  def find(value, node = @head, index = 0)
    return index if node.value == value
    return nil if node.next_node.nil?
    find(value, node.next_node, index + 1)
  end 

  # formats nodes into ( value ) -> ( value ) -> ( value ) -> nil
  def to_s(node = @head, string = '')
    string += "(#{node.value}) -> "
    return string += "nil" if node.next_node.nil?
    to_s(node.next_node, string)
  end
  

end