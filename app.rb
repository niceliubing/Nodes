require 'berlin-ai'         # Require the berlin-ai library.

class Berlin::AI::Player
  def self.on_turn(game)         # Implement the on_turn method of Berlin::AI::Player.
    # Do your magic here.

    # each node
    game.map.controlled_nodes.each do |node|
        
      node.adjacent_nodes.shuffle.each do |other_node|
        soldiers = rand(0..(node.available_soldiers))
        game.add_move(node, other_node, soldiers)
      end
      
    end
  end
end


#all addjacent nodes are mine - keep only one soldier
def isNodeInDanger(node)
    
    node.adjacent_nodes.each do |other_node|
      #other_node.      
    end
  
end

#get nodes closer to the enemy





