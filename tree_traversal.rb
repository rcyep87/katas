class Node

  attr_accessor :first_child, :next_sibling

  def countDescendants
    if self.first_child.nil?
      return 0
    else
      self.first_child.tree_value
    end
  end

  def tree_value
    if self.first_child == nil && self.next_sibling == nil
      return 1
    elsif self.first_child != nil && self.next_sibling == nil
      return self.first_child.tree_value + 1
    elsif self.first_child == nil && self.next_sibling != nil
      return self.next_sibling.tree_value + 1
    elsif self.first_child != nil && self.next_sibling != nil
      return self.first_child.tree_value + self.next_sibling.tree_value + 1
    end
  end

end

def generateTree(root, depth, max_depth)
  if depth <= max_depth
    root.first_child = Node.new
    generateTree(root.first_child, depth + 1, max_depth)
    root.next_sibling = Node.new
    generateTree(root.next_sibling, depth + 1, max_depth)
    root
  end
end

root = generateTree(Node.new, 0, 0) #expecting 1
root.countDescendants

root = generateTree(Node.new, 0, 1) #expecting 3
root.countDescendants

root = generateTree(Node.new, 1, 1) #expecting 1
root.countDescendants

root = generateTree(Node.new, 0, 2) #expecting 7
root.countDescendants

root = generateTree(Node.new, 0, 3) #expecting 15
root.countDescendants

root = generateTree(Node.new, 0, 4) #expecting 31
root.countDescendants
