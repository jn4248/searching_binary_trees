require "./bs"

###  NEED TO SET UP FOR EACH OF THREE DFS SEARCHES....
# def test_dfs(tree, data, expect_msg)
#   puts "__________________________________________________________________"
#   puts "\nDepth-first-search for #{data}:"
#   puts "Expected:  #{expect_msg}\n "
#   node = tree.depth_first_search(data)
#   node.show_stats unless node.nil?
#   puts "Node Returned: nil" if node.nil?
#   puts "End of Test..."
#   puts "__________________________________________________________________"
# end


arr1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
arr2 = [0, -2, 2, -3, -1, 1, 3]
arr3 = [3]
arr4 = []
arr5 = %w{Do hi Do AS as do lo Hi}
arr6 = [0, -3, -2, -1, 3, 4, 5]

b = BinaryTree.new()

puts "\n==============================================================\n "
b.build_tree(arr1)
b.show_binary_tree
node = b.depth_first_search_pre_order(4)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?

puts "\n==============================================================\n "
b.build_tree(arr2)
b.show_binary_tree
node = b.depth_first_search_pre_order(2)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?

puts "\n==============================================================\n "
b.build_tree(arr3)
b.show_binary_tree
node = b.depth_first_search_pre_order(3)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?

puts "\n==============================================================\n "
b.build_tree(arr4)
b.show_binary_tree
node = b.depth_first_search_pre_order(nil)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(0)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?

puts "\n==============================================================\n "
b.build_tree(arr5)
b.show_binary_tree
node = b.depth_first_search_pre_order("do")
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?

puts "\n==============================================================\n "
b.build_tree(arr6)
b.show_binary_tree
node = b.depth_first_search_pre_order(3)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order("nil")
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(nil)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
node = b.depth_first_search_pre_order(10000)
puts "\nNode found:" unless node.nil?
node.show_stats unless node.nil?
puts "Node Returned: nil" if node.nil?
