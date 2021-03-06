require "./strategies/abstractStrategy"
require "./strategies/result"

  class Move_Free_Node_Strategy < Strategy
        def apply_on_node node, game
            results = []
            total_free_adjacent_nodes = 0;

            node.adjacent_nodes.each do |other_node|
              if other_node.free?
                 total_free_adjacent_nodes += 1;
              end
            end

            node.adjacent_nodes.each do |other_node|
              if other_node.free?

                move_action = Strategy_result.new
                move_action.node = node
                move_action.other_node = other_node
                move_action.number_of_soldiers =  (node.available_soldiers/total_free_adjacent_nodes).round
                move_action.points = 1#(other_node.types == "city" ? 2 : 1)
                move_action.strategy_name = "move free node"
                results.push move_action

              end
            end

            return results;
            #if results.length > 0

             #results.sort_by!{|node| node.other_node.soldiers_per_turn}.reverse
             # r = results.sort_by{|x| -x.other_node.soldiers_per_turn]}
             #return results.at(0)
             # return results.sort_by { |r| -r[:points] }[0]
            #end

        end

  end
