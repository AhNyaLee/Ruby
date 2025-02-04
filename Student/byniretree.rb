
require_relative 'Node'
require_relative 'Students'
require_relative 'bynire_iterator.rb'

class BinaryTree 
    
    include Enumerable
    
    attr_accessor :root

    def initialize
        self.root = nil
    end

    def add(value)
        new_node = value.is_a?(Student) ? Node.new(value: value) : nil

        if new_node.nil?
            raise ArgumentError, 'Invalid argument'
        end

        if self.root.nil?
            self.root = new_node
        else
        insert(self.root, new_node)
        end
    end

    def iterator 
        Binary_iterator.new(self.root)
    end

    private

    def insert(root, node)
        return node if root.nil?

        if node.value < root.value
            insert(root.left, node)
            root.left = node
            root.left.parent = root
        else 
            insert(root.right, node)
            root.right = node
            root.right.parent = root
        end
    end

    end
