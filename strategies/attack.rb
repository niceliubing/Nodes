
require "./strategies/abstractStrategy"
require "./strategies/result"
  
  
  class Simple_attack_strategy < Strategy
  
      def apply_on_node node, game
        results = []
        
        node.adjacent_nodes.each do |other_node|
     
           if other_node.enemy?
             #evaluate if is convinient
             
              if node.available_soldiers > other_node.number_of_soldiers + 1

                attack_result = Strategy_result.new
                attack_result.node = node
                attack_result.other_node = other_node
                attack_result.number_of_soldiers = other_node.number_of_soldiers + 1
                attack_result.points = 1# other_node.types == 'city' ? 2 : 1
                attack_result.strategy_name = "attack"
                results.push attack_result
              end
           end
          
        end

        if results.length > 0
           puts "results length #{results.length}"
          return results.at(0) #result.sort_by { |r| -r[:points] }[0]
        
        end
        
      end
  
  end