require "./binary_search"

def test_show_binary_tree(tree, array)
  puts "=================================================================="
  puts "\nBuilding Tree..."
  tree.build_tree(array)
  all_nodes = tree.all_node_values_with_nil
  all_nodes_no_nil = all_nodes.select { |value| !value.nil? }
  puts "\nAll Node Values in complete tree (with nil nodes):"
  p all_nodes
  puts "\nAll Node Vaules in complete tree (without nil nodes):"
  p all_nodes_no_nil
  puts "\nMax node length       = #{tree.max_node_value_length}"
  puts "Number of tree levels = #{tree.num_tree_levels}"
  puts "\n\nPrinting Binary Tree...\n "
  tree.show_binary_tree
  puts "\n...End Print Binary Tree."
  puts "=================================================================="
end

def test_sum_base_to_exponent_series(tree, test_desc, base, first_exp, second_exp, expect_sum)
  puts "\nTest sum_base_to_exponent_series: #{test_desc}"
  puts "Base: #{base}, Exponents: #{first_exp} to #{second_exp}"
  sum = tree.sum_base_to_exponent_series(base, first_exp, second_exp)
  sum = "nil" if sum.nil?
  puts "Sum      = #{sum}"
  puts "Expected:  #{expect_sum}"
  puts ">>> ERROR <<< " unless sum == expect_sum
end

def random_number_array(size, min, max)
  arr = []
  adjustment = min < max ? min : max
  size.times do
    arr << rand(max - min) + adjustment
  end
  return arr
end

def test_title(title)
  puts "\n=================================================================="
  puts "=================================================================="
  puts "\nTesting: #{title}\n "
  puts "=================================================================="
  puts "==================================================================\n "
end

# establish test arrays and binary tree
arr1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
arr2 = [0, -2, 2, -3, -1, 1, 3]
arr3 = [3]
arr4 = []
arr5 = %w{Do hi Do AS as do lo Hi}
arr6 = [0, -3, -2, -1, 3, 4, 5]
arr7a = random_number_array(6, 0, 99999)
arr7b = random_number_array(6, 0, 99999)
arr7c = random_number_array(10, 0, 99999)
arr7d = random_number_array(10, 0, 99999)
arr8a = random_number_array(10, -50000, 50000)
arr8b = random_number_array(10, -50000, 50000)

b = BinaryTree.new()

# Testing sum_base_to_exponent_series
test_title("(method) sum_base_to_exponent_series()")
test_case = "Exponent 1 = Exponent 2"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 0, 1)
test_case = "Exponent 1 > Exponent 2"
test_sum_base_to_exponent_series(b, test_case, 2, 2, 0, 'nil')
test_case = "Exponent 1 has decimal (float)"
test_sum_base_to_exponent_series(b, test_case, 2, 1.2, 0, 'nil')
test_case = "Exponent 2 has decimal (float)"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 2.2, 'nil')
test_case = "Both Exponents have  decimal (float)"
test_sum_base_to_exponent_series(b, test_case, 2, 1.5, 1.2, 'nil')
test_case = "Both Exponents have decimal, but are equal"
test_sum_base_to_exponent_series(b, test_case, 2, 1.2, 1.2, 'nil')
test_case = "Both Exponents are negative"
test_sum_base_to_exponent_series(b, test_case, 2, -1, -1, 'nil')
test_case = "Exponent 1 is a negative"
test_sum_base_to_exponent_series(b, test_case, 2, -1, 1, 'nil')
test_case = "Both Exponents are valid"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 1, 3)
test_case = "Both Exponents are valid"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 2, 7)
test_case = "Both Exponents are valid"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 3, 15)
test_case = "Both Exponents are valid"
test_sum_base_to_exponent_series(b, test_case, 2, 0, 4, 31)



# Testing various arrays:
# show_binary_tree(), breadth_first_search(), depth_first_search(), and dfs_rec()
test_title("Array: Uneven, right children only (given in TOP instructions)")
test_show_binary_tree(b, arr1)


test_title("Array: Even, complete tree")
test_show_binary_tree(b, arr2)


test_title("Array: Root only (only 1 element)")
test_show_binary_tree(b, arr3)


test_title("Array: Empty / nil")
test_show_binary_tree(b, arr4)


test_title("Array: Strings, lowercase and uppercase")
test_show_binary_tree(b, arr5)


test_title("Array: Uneven, left and right")
test_show_binary_tree(b, arr6)


test_title("Array: Random numbers (6) between 0 and 99999")
test_show_binary_tree(b, arr7a)

test_title("Array: Random numbers (6) between 0 and 99999")
test_show_binary_tree(b, arr7b)

test_title("Array: Random numbers (10) between 0 and 99999")
test_show_binary_tree(b, arr7c)


test_title("Array: Random numbers (10) between 0 and 99999")
test_show_binary_tree(b, arr7d)


test_title("Array: Random numbers (10) between -50000 and 50000")
test_show_binary_tree(b, arr8a)


test_title("Array: Random numbers (10) between -50000 and 50000")
test_show_binary_tree(b, arr8b)
