require 'minitest/autorun'
require 'minitest/pride'
require_relative 'tree'
require 'pry'

class TreeTest < Minitest::Test  
  
  def setup
    @tree = Tree.new
  end
  
  def test_it_initializes_with_nil_head
    assert_equal nil, @tree.head
  end
  
  def test_it_can_insert_the_first_node
    node =  Node.new(5)
    @tree.insert(node)
    assert_equal 5, @tree.head.value
  end
  
  def test_it_can_second_node
    node =  Node.new(5)
    node1 =  Node.new(3)
    @tree.insert(node)
    @tree.insert(node1)
    assert_equal 3, @tree.head.left.value
  end
  
  def test_it_can_second_node_to_the_left
    node =  Node.new(5)
    node1 =  Node.new(3)
    node2 =  Node.new(2)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node2)
    assert_equal 2, @tree.head.left.left.value
  end
  
  
  def test_it_can_third_node_to_the_left
    node =  Node.new(5)
    node1 =  Node.new(3)
    node2 =  Node.new(2)
    node3 =  Node.new(1)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node2)
    @tree.insert(node3)
    assert_equal 1, @tree.head.left.left.left.value
  end
  
  def test_it_can_insert_node_to_right
    node =  Node.new(5)
    node1 =  Node.new(8)
    @tree.insert(node)
    @tree.insert(node1)
    assert_equal 8, @tree.head.right.value
  end
  
  def test_it_can_insert_node_to_right_again
    node =  Node.new(5)
    node1 =  Node.new(8)
    node2 =  Node.new(9)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node2)
    assert_equal 9, @tree.head.right.right.value
  end
  
  def test_it_can_insert_node_to_right_again_and_againe
    node =  Node.new(5)
    node1 =  Node.new(8)
    node2 =  Node.new(9)
    node3 =  Node.new(10)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node2)
    @tree.insert(node3)
    assert_equal 10, @tree.head.right.right.right.value
  end
  
  def test_it_can_assert_a_value_is_there
    node =  Node.new(5)
    @tree.insert(node)
    assert_equal true, @tree.includes?(5)
  end
  
  def test_it_can_assert_a_value_is_there_again
    node =  Node.new(5)
    node1 = Node.new(3)
    @tree.insert(node)
    @tree.insert(node1)
    assert_equal true, @tree.includes?(3)
  end
  
  def test_it_can_assert_a_value_is_there_again_and_again
    node =  Node.new(5)
    node1 = Node.new(3)
    node2 = Node.new(2)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node2)
    assert_equal true, @tree.includes?(2)
  end
  
  def test_it_can_assert_a_value_is_there_again_and_again_again
    node =  Node.new(5)
    node1 = Node.new(3)
    node2 = Node.new(2)
    node3 = Node.new(1)
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node3)
    assert_equal true, @tree.includes?(1)
  end 
  
  def test_it_can_assert_a_value_is_there_right
    node =  Node.new(5)
    node1 = Node.new(7)
    @tree.insert(node)
    @tree.insert(node1)
    assert_equal true, @tree.includes?(7)
  end
  
  def test_it_can_assert_a_value_is_there_right_again
    node =  Node.new(5)
    node1 = Node.new(7)
    node3 = Node.new(10)
    
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node3)
    assert_equal true, @tree.includes?(10)
  end
  
  def test_it_can_refute_value
    node =  Node.new(5)
    node1 = Node.new(7)
    node3 = Node.new(10)
    
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node3)
    assert_equal false, @tree.includes?(8)
  end
  
  def test_it_can_refute_value_again
    node =  Node.new(5)
    node1 = Node.new(7)
    node3 = Node.new(10)
    
    @tree.insert(node)
    @tree.insert(node1)
    @tree.insert(node3)
    assert_equal false, @tree.includes?(3)
  end   
end

class NodeTest < Minitest::Test
  def test_it_initializes
    node = Node.new(5)
    assert 5, node.value
    assert_equal nil, node.left
    assert_equal nil, node.right
  end
end