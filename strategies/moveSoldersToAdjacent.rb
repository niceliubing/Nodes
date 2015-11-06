
require "./strategies/abstractStrategy"
require "./strategies/result"


  class Move_soldiers_to_adjacent_nodes < Strategy

  def apply_on_node node, game
        results = []
        has_enemy_node = false
        total_enemy_soldiers = 0
        owned_adjacent_node = nil
        number_of_owned_adjacent_node = 0

            node.adjacent_nodes.each do |other_node|
                  if other_node.enemy?
                    has_enemy_node = true
                    total_enemy_soldiers += other_node.number_of_soldiers
                  elsif other_node.occupied?

                    number_of_owned_adjacent_node +=1
                    if owned_adjacent_node.nil? || owned_adjacent_node.soldiers_per_turn < other_node.soldiers_per_turn
                      owned_adjacent_node = other_node
                    end
                  end
            end

            if (node.available_soldiers > total_enemy_soldiers) && !owned_adjacent_node.nil?

                move_action = Strategy_result.new
                move_action.node = node
                move_action.other_node = owned_adjacent_node
                move_action.number_of_soldiers =  1#node.available_soldiers - total_enemy_soldiers
                move_action.points = 1#(other_node.types == "city" ? 2 : 1)
                move_action.strategy_name = "move soldiers to adjacent owned node"
              #  puts  "node.available_soldiers= #{node.available_soldiers} number_of_soldiers #{ node.number_of_soldiers } incoming_soldiers #{node.incoming_soldiers}"

                results.push(move_action) unless results.include?(move_action)
             #r = results.sort_by {|x| x.points}
             return results.at(0)
             # return results.sort_by { |r| -r[:points] }[0]
            end

  end

  end
