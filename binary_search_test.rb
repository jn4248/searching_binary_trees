require "./bs"

# Method to set up a binary tree with an array of data and display the tree
def set_next_binary_tree(tree, arr)
  puts "\n======================================================================="
  puts "======================================================================="
  puts "======================================================================="
  puts "\nNext Test Array: \n "
  p arr
  tree.build_tree(arr)
  tree.show_binary_tree
  puts "\n=======================================================================\n "
end

# Method to test breadth_first_search, and display the results.
# Runs the "debug" version (to show more information), and then compares
# the results to the "non-debug" version, to ensure their results match.
def test_bfs(tree, data, expect_msg)
  puts "------------------------------------------------------------"
  puts "------------------------------------------------------------"
  puts "\nBreadth-first-search (with debug) for '#{data}':"
  puts "\nExpected:  #{expect_msg}\n "
  node = tree.breadth_first_search_with_debug(data)
  if node.nil?
    puts "\nNode Returned: nil"
  else
    puts "\nNode found:"
    node.show_stats
  end
  version_match = true if tree.breadth_first_search(data) == node
  puts "\nMethod's debug version matches non-debug version:  #{version_match.to_s}"
  puts "\nEnd of Test..."
  puts "------------------------------------------------------------"
end

# Method to test depth_first_search_pre_order (iterative version), and
# display the results.
# It runs the "debug" version (to show more information), and then compares
# the results to the "non-debug" version, to ensure their results match.
def test_dfs_pre(tree, data, expect_msg)
  puts "__________________________________________________________"
  puts "__________________________________________________________"
  puts "\nIterative Depth-first-search (pre-order) (with debug) for '#{data}':"
  puts "\nExpected:  '#{expect_msg}'\n "
  node = tree.depth_first_search_pre_order_with_debug(data)
  if node.nil?
    puts "\nNode Returned: nil"
  else
    puts "\nNode found:"
    node.show_stats
  end
  version_match = true if tree.depth_first_search_pre_order(data) == node
  puts "\nMethod's debug version matches non-debug version:  #{version_match.to_s}"
  puts "\nEnd of Test..."
  puts "__________________________________________________________"
end


# Method to test the dfs_rec (recursive version of pre-order depth-first search)
# and display the results.
def test_dfs_rec(tree, data, expect_msg)
  puts ">>>>>>>>>>>>>>>----------------------------<<<<<<<<<<<<<<<"
  puts ">>>>>>>>>>>>>>>----------------------------<<<<<<<<<<<<<<<"
  puts "\nRecursive Depth-first-search (pre-order) for '#{data}':"
  puts "\nExpected:  '#{expect_msg}'\n "
  node = tree.dfs_rec(data)
  if node.nil?
    puts "\nNode Returned: nil"
  else
    puts "\nNode found:"
    node.show_stats
  end
  puts "\nEnd of Test..."
  puts ">>>>>>>>>>>>>>>----------------------------<<<<<<<<<<<<<<<"
end

# Test Arrays
arr1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
arr2 = [0, -2, 2, -3, -1, 1, 3]
arr3 = [3]
arr4 = []
arr5 = %w{Do hi Do AS as do lo Hi}
arr6 = [0, -3, -2, -1, 3, 4, 5]

# Binary tree object used for testing
b = BinaryTree.new()

# Test array arr1
set_next_binary_tree(b, arr1)
msg = "Node: 4  (Left Child: 3  Right Child: 5  Parent: 7)"
test_bfs(b, 4, msg)
test_dfs_pre(b, 4, msg)
test_dfs_rec(b, 4, msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)

# Test array arr2
set_next_binary_tree(b, arr2)
msg = "Node: 2  (Left Child: 1  Right Child: 3  Parent: 0)"
test_bfs(b, 2, msg)
test_dfs_pre(b, 2, msg)
test_dfs_rec(b, 2, msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)

# Test array arr3
set_next_binary_tree(b, arr3)
msg = "Node: 3  (Left Child: nil  Right Child: nil  Parent: nil)"
test_bfs(b, 3, msg)
test_dfs_pre(b, 3, msg)
test_dfs_rec(b, 3, msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)

# Test array arr4
set_next_binary_tree(b, arr4)
msg = "nil (not found)"
test_bfs(b, nil, msg)
test_dfs_pre(b, nil, msg)
test_dfs_rec(b, nil, msg)
msg = "nil (not found)"
test_bfs(b, 0, msg)
test_dfs_pre(b, 0, msg)
test_dfs_rec(b, 0, msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)

# Test array arr5
set_next_binary_tree(b, arr5)
msg = "Node: 'as'  (Left Child: 'Hi'  Right Child: 'do'  Parent: 'hi')"
test_bfs(b, "as", msg)
test_dfs_pre(b, "as", msg)
test_dfs_rec(b, "as", msg)
msg = "Node: 'do'  (Left Child: nil  Right Child: nil  Parent: 'as')"
test_bfs(b, "do", msg)
test_dfs_pre(b, "do", msg)
test_dfs_rec(b, "do", msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)

# Test array arr6
set_next_binary_tree(b, arr6)
msg = "Node: 3  (Left Child: nil  Right Child: 4  Parent: 0)"
test_bfs(b, 3, msg)
test_dfs_pre(b, 3, msg)
test_dfs_rec(b, 3, msg)
msg = "nil (not found)"
test_bfs(b, "nil", msg)
test_dfs_pre(b, "nil", msg)
test_dfs_rec(b, "nil", msg)
msg = "nil (not found)"
test_bfs(b, nil, msg)
test_dfs_pre(b, nil, msg)
test_dfs_rec(b, nil, msg)
msg = "nil (not found)"
test_bfs(b, 10000, msg)
test_dfs_pre(b, 10000, msg)
test_dfs_rec(b, 10000, msg)
