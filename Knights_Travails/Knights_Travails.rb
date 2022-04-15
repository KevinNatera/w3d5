require 'byebug'
require_relative "Node"

class KnightPathFinder
    attr_reader :consideredPositions

    def initialize()
        @rootNode = PolyTreeNode.new([0,0])
        @consideredPositions = [@rootNode]
    end


    def new_move_position(pos)
        newConsideredPositions = []
            # debugger
        KnightPathFinder.valid_moves(pos).each do |move|

           if !@consideredPositions.include?(move) && !newConsideredPositions.include?(move) 
                newConsideredPositions << move
           end
       end
       @consideredPositions += newConsideredPositions
        newConsideredPositions
       
    end


    def build_move_tree(last_pos)
        #array = []
        queue = [@rootNode]
        path = []

        while !queue.empty?

        queue.each do |start_move|

            childArr = new_move_position(start_move)

                    childArr.each do |child|
                        start_move.add_child(child)
                    end
            
            queue += new_move_position(start_move)
        
             while path[0].parent != nil
                if queue[0].value == last_pos
                    path << queue[0]
                    path.unshift(queue[0].parent)
                end
            end
                path.map { |pos| pos.value     }
            end
            
     end

    end


    def self.valid_moves(node)
        x = node.value[0]
        y = node.value[1]

        moveArr = [[x + 2, y + 1] , [x + 1, y + 2] , [ x - 2, y - 1] , [x - 1, y - 2] ,[x - 2, y + 1] , [x - 1, y + 2] ,[x + 1, y - 2] , [x + 2 , y - 1] ] 

        moveArr.map { |ele| PolyTreeNode.new(ele) }

        moveArr
    end

end



k = KnightPathFinder.new 

 p k.build_move_tree([4,8])

 
