require 'pry'

class Tree
  attr_accessor :head
  
  def initialize
    @head = nil
  end
  
  def insert(node, current_node=@head)
    if head.nil?
      @head = node
    elsif node.value < current_node.value
      if current_node.left.nil?
        current_node.left = node
      else
        current_node = current_node.left
        insert(node, current_node)
      end
    elsif node.value > current_node.value
      if current_node.right.nil?
        current_node.right = node
      else 
        current_node = current_node.right
        insert(node, current_node)
      end
    end
  end
  
  def includes?(value, current_node=@head)
    if current_node.value == value
      true
    elsif value < current_node.value
      if current_node.left.nil?
        false
      elsif current_node.left.value == value
        true
      else
        current_node = current_node.left
        includes?(value, current_node)
      end
    elsif value > current_node.value
      if current_node.right.nil?
        false
      elsif current_node.right.value == value
        true
      else
        current_node = current_node.right
        includes?(value, current_node)
      end
    end
  end
  
end

class Node
  attr_accessor :right, :left
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end