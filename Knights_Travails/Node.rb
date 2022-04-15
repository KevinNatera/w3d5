require 'byebug'

class PolyTreeNode
    attr_reader :value, :parent, :children 

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end


    def parent=(parent_node)
        # debugger
        if @parent != nil 
        old_parent = self.parent 
        old_parent.children.delete(self)
        end 


        @parent = parent_node 
        if parent_node != nil 
        @parent.children << self 
        end
    end


    def add_child(child_node)
        child_node_with_parent = child_node.parent=(self)
        
         if !@children.include?(child_node)
        @children << child_node_with_parent
        end
    end


    def remove_child(child_node)
        if @children.include?(child_node)
        child_node.parent=(nil)
        @children.delete(child_node)
        else  
            raise "Error"
        end
    end
    def dfs(target_value)
        #debugger
        return self if @value == target_value
        @children.each do |child|
            dfs_child = child.dfs(target_value)
            return dfs_child if dfs_child != nil
        end
        nil
    end
    def bfs(target_value)
        arr = [self]
        while !arr.empty?
            if arr[0].value ==target_value
                return arr[0]
            end
            arr += arr[0].children
            arr.shift
        end
    end
end


