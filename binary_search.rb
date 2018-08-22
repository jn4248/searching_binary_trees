
class BinaryTree

  attr_reader :root

  def intitialize(root_node = nil)
    @root = root_node
  end

  # define the binary tree data by reading the contents of an array.
  # Over-writes exisitng data if called on an existing tree.
  # Considers an empty tree (root = nil) to not contain 'nil'
  def build_tree(data_array)
    @root = nil  # overwrites tree, even if array is empty
    data_array.each_with_index do |data, index|
      if index == 0
        @root = Node.new(data)
      else
        set_next_node(data)
      end
    end
  end

  # Returns, from the binary tree, the node which contains 'data'
  # Returns 'nil' if no match is found, or if tree is empty (Root = nil).
  def breadth_first_search(data)
    queue = [@root]
    node_match = nil
    match_found = false
    until queue.empty? || match_found || @root.nil?
      cur_node = queue.first
      if cur_node.value == data
        match_found = true
        node_match = cur_node
      else
        queue.push(cur_node.left_child) unless cur_node.left_child.nil?
        queue.push(cur_node.right_child) unless cur_node.right_child.nil?
        queue.shift
      end
    end
    return node_match
  end

  # Same method as breadth_first_search, but with debugging output that lists
  # the number nodes visited, and the actual order visited.
  def breadth_first_search_with_debug(data)
    search_order = []                                         # For Debug output
    queue = [@root]
    node_match = nil
    match_found = false
    until queue.empty? || match_found || @root.nil?
      cur_node = queue.first
      next_node_value = cur_node.nil? ? "nil" : cur_node.value # For Debug output
      search_order << next_node_value                         # For Debug output
      if cur_node.value == data
        match_found = true
        node_match = cur_node
      else
        queue.push(cur_node.left_child) unless cur_node.left_child.nil?
        queue.push(cur_node.right_child) unless cur_node.right_child.nil?
        queue.shift
      end
    end
    puts "Breadth-first search order for nodes visited:"      # For Debug output
    p search_order                                            # For Debug output
    puts "\nTotal nodes visited:  #{search_order.size}"       # For Debug output
    return node_match
  end

  # Iterative Pre-Order depth-first search (Parent -> Left Child -> Right Child)
  # Returns, from the binary tree, the node which contains 'data'
  # Returns 'nil' if no match is found, or if tree is empty (Root = nil).
  def depth_first_search_pre_order(data)
    stack = [@root]
    node_match = nil
    match_found = false
    until stack.empty? || match_found || @root.nil?
      cur_node = stack.pop
      if cur_node.value == data
        match_found = true
        node_match = cur_node
      end
      right = cur_node.right_child
      stack.push(right) unless right.nil?
      left = cur_node.left_child
      stack.push(left) unless left.nil?
    end
    return node_match
  end

  # Same method as depth_first_search_pre_order (iterative), but with debugging
  # output that lists the number nodes visited, and the actual order visited.
  def depth_first_search_pre_order_with_debug(data)
    search_order = []                                        # For Debug output
    stack = [@root]
    node_match = nil
    match_found = false
    until stack.empty? || match_found || @root.nil?
      cur_node = stack.pop
      next_node_value = cur_node.nil? ? "nil" : cur_node.value # For Debug output
      search_order << next_node_value                         # For Debug output
      if cur_node.value == data
        match_found = true
        node_match = cur_node
      end
      right = cur_node.right_child
      stack.push(right) unless right.nil?
      left = cur_node.left_child
      stack.push(left) unless left.nil?
    end
    puts "Pre_order depth-first search order for nodes visited:" # For Debug output
    p search_order                                            # For Debug output
    puts "\nTotal nodes visited:  #{search_order.size}"       # For Debug output
    return node_match
  end

  # Recursive Pre-Order depth-first search (Parent -> Left Child -> Right Child)
  # Returns, from the binary tree, the node which contains 'data'
  # Returns 'nil' if no match is found, or if tree is empty (Root = nil).
  def dfs_rec(data, cur_node = @root)
    node_match = nil
    unless cur_node.nil?
      if cur_node.value == data
        node_match = cur_node
      else
        # check for matches along each child path ('nil' returned = no match found)
        unless cur_node.left_child.nil?
          left_match = dfs_rec(data, cur_node.left_child)
          node_match = left_match unless left_match.nil?
        end
        unless cur_node.right_child.nil?
          right_match = dfs_rec(data, cur_node.right_child)
          node_match = right_match unless right_match.nil?
        end
      end
    end
    return node_match
  end


  # Displays the binary tree to console with minor formatting
  def show_binary_tree
    text = tree_levels_text_array
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "\nBinary Tree Display:\n "
    text.each { |row| puts "\n" + row }
    puts "\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  end


  # Creates a new node in the Binary Tree by tracing path from Root.
  # new nodes with data value less than parent are placed along left_child path
  def set_next_node(data)
    data_placed = false
    temp = @root
    until data_placed
      if data == temp.value
        data_placed = true
      elsif data < temp.value
        if temp.left_child.nil?
          temp.left_child = Node.new(data, temp)
          data_placed = true
        else
          temp = temp.left_child
        end
      else # data > temp.value
        if temp.right_child.nil?
          temp.right_child = Node.new(data, temp)
          data_placed = true
        else
          temp = temp.right_child
        end
      end
    end
  end

  # Builds an array of text to print binary tree.  Each array position is a
  # row of text that represents one level of the tree.
  # Position 0 is level 0 (top-level, or Root), Position 1 is level 1, etc...
  # (Uses fact that there are 2^n nodes in each level "n", level 0 = root level)
  # This really only works well for smaller trees.  Tree display starts to
  # become distorted more and more at levels > 5, or if the string length of
  # the node values is greater than 3.
  def tree_levels_text_array
    text_rows = []
    num_levels = num_tree_levels
    # set string size for spacing and "nil" nodes (with default if tree too big)
    max_length = (num_levels > 4) ? 2 : max_node_value_length
    blank_node = "_" * max_length  # text for nil nodes
    cell_pad = " " * max_length    # text for cell padding / spacing
    all_nodes = all_node_values_with_nil  # array of all node values (breadth_first order)
    level = 0
    cur_node = 0        # Track position in array "all_nodes"
    # track each tree level
    while level < num_levels
      level_exponent = num_levels - level - 1   # sets exponent series range
      # inner_padding: num spacing cell-pads between nodes (not before 1st node)
      inner_padding = sum_base_to_exponent_series(2, 0, level_exponent)
      # outer_padding: num spacing cell-pads before first node
      outer_padding = inner_padding - 2**(level_exponent)
      row_string = ""
      row_string << cell_pad * outer_padding
      num_nodes_in_row = 2**level     # all_nodes is a "complete binary tree"
      # "counter" avoids adding inner_padding after last node on each level
      counter = 1
      # track the node placement, from array "all_nodes"
      num_nodes_in_row.times do
        next_value = all_nodes[cur_node].nil? ? blank_node : all_nodes[cur_node].to_s
        row_string << next_value
        row_string << cell_pad * inner_padding unless counter == num_nodes_in_row
        cur_node += 1
        counter += 1
      end
      row_string << " (Root)" if level == 0
      text_rows.push(row_string)
      level += 1      # must adjust padding before incrementing level
    end
    # Add display note if tree is empty
    text_rows[0] = "(Empty Tree: Root = nil)" if text_rows.empty?
    return text_rows
  end

  # Returns an array of all node values in breadth-first search order.
  # Includes 'nil' nodes, such that the array is a representation of the tree
  # as a complete binary tree (even if the actual binary tree is NOT complete)
  def all_node_values_with_nil
    tree_nodes = []
    queue = [@root]
    queue_all_nil = false
    # continue adding all child nodes to queue until it contains only nil nodes
    until queue_all_nil
      cur_node = queue.first
      next_value = cur_node.nil? ? nil : cur_node.value
      tree_nodes << next_value
      if cur_node.nil?
        # maintain "complete tree" structure using nil in queue where no nodes
        2.times {queue.push(nil)}
      else
        queue.push(cur_node.left_child)
        queue.push(cur_node.right_child)
      end
      queue.shift
      queue_all_nil = queue.all? {|node| node.nil?}
    end
    return tree_nodes
  end

  # Returns the number of levels in the binary tree
  def num_tree_levels
    level = 0
    num_nodes= all_node_values_with_nil.length    # considers tree as 'complete
    num_nodes_in_full_tree = 2**level
    until num_nodes_in_full_tree >= num_nodes
      level += 1
      num_nodes_in_full_tree += 2**level
    end
    num_tree_levels = level + 1   # (started count at 0)
    num_tree_levels = 0 if @root.nil?
    return num_tree_levels
  end


  # Returns the length of string for the node whose string representation
  # is the longest among all nodes in the tree
  def max_node_value_length
    max_length = 0
    all_node_values_with_nil.each do |value|
      value_length = value.to_s.length
      max_length = value_length if value_length > max_length
    end
    return max_length
  end


  # sums the series: base**m, base**(m+1)...base**(n-1), base**(n)
  # Assumes exponents are positive integers, and first_exp <= second_exp
  # eg: (2, 0, 3) => 2^0 + 2^1 + 2^2 + 2^3
  # Returns base^exp, if first_exp = second_exp (trivial case)
  # Returns 'nil' if first_exp > second_exp, or exponents not positivbe integers
  def sum_base_to_exponent_series(base, first_exp, second_exp)
    sum = 0
    if (first_exp.is_a?(Integer)  &&
        second_exp.is_a?(Integer) &&
        first_exp <= second_exp   &&
        first_exp >= 0            &&
        second_exp >= 0)
      if first_exp == second_exp
        sum = base**first_exp
      else
        exp = first_exp
        until exp > second_exp
          sum += base**exp
          exp += 1
        end
      end
    else
      # parameter conditions not met
      sum = nil
    end
    return sum
  end

end  # end class BinarySearchTree

# Node for binary tree
class Node

  attr_accessor :left_child, :right_child
  attr_reader :value, :parent

  def initialize(value, parent = nil)
    @value       = value
    @parent      = parent
    @left_child  = nil
    @right_child = nil
  end

  def show_stats
    puts "\nNode Statistics:"
    val = @value.nil? ? "nil" : @value
    lc = @left_child.nil? ? "nil" : @left_child.value
    rc = @right_child.nil? ? "nil" : @right_child.value
    par = @parent.nil? ? "nil" : @parent.value
    puts "Value:              '#{val}'"
    puts "Left_child value:   '#{lc}'"
    puts "Right_child value:  '#{rc}'"
    puts "Parent value:       '#{par}'"
  end

end  # end class Node
