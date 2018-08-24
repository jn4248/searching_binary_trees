# searching_binary_trees

## Overview
Project 1 of section "Project: Data Structures and Algorithms," from The Odin Project series.  

Contains two classes, Binary_Tree and Node.

Three search methods are implemented for the binary tree class:

* Breadth-first search
* Iterative pre-order depth-first search
* Recursive pre-order depth-first search

Binary trees are assumed to contain elements of the same (or compatible) data types, and the search methods allow for their search parameter to be of a different variable type than that of the binary tree elements.

Note that there is an alternate implementation of the recursive pre-order depth-first search method which has slightly more simple code, but requires all elements in the binary tree (ie: in the array used to create the binary tree), to be of the same data type (eg: trying to search for "do" in a binary tree of integers fails because you can't use '>' to compare these two types, however the other implementation allows you compare a binary tree that was constructed using both integers and floats).

There are also two separate test files that show console output.  `binary_search_test.rb` tests the three main methods listed above, while `binary_search_utilities_test` provides additional testing for the extra helper methods that were created.

## Class Binary_Tree

Class Binary_Tree contains several main methods:

* `build_tree` : updates and existing binary tree object using the data from an array.

* `breadth_first_search` : Runs a breadth-first search for a given data value.

* `breadth_first_search_with_debug` : Works the same as `breadth_first_search` except that it sends additional information to the console to track the node search path used by the algorithm.

* `depth_first_search_pre_order` : Runs an iterative pre-order depth-first search for a given data value.

* `depth_first_search_pre_order_with_debug` : Works the same as `depth_first_search_pre_order` except that it sends additional information to the console to track the node search path used by the algorithm.

* `dfs_rec` : Runs a recursive pre-order depth-first search for a given data value.

* `show_binary_tree` : Displays the binary tree to console in a pattern similar to the following:

                      0 (Root)

              -3               3

          __     -2       __      4

        __  __  __  -1  __  __  __  5


This class also contains several other internal 'helper' methods.  

## Class Node

Class Node contains the following helper method:

* `show_stats` : Displays the main information about the node to console.
