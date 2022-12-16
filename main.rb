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
  
end