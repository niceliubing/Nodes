require 'berlin-ai'         # Require the berlin-ai library.
require "./strategies/attack"
require "./strategies/moveFreeNode"
require "./strategies/moveSoldersToAdjacent"
require 'pry-byebug';


class Berlin::AI::Player
  def self.on_turn(game)         # Implement the on_turn method of Berlin::AI::Player.
    # set strategies
    strategies = [];
    results = [];

    strategies.push Simple_attack_strategy.new
    strategies.push Move_Free_Node_Strategy.new
    strategies.push Move_soldiers_to_adjacent_nodes.new


    # each node
    game.map.controlled_nodes.each do |node|

      strategies.each do |strategy|
          currentResult =  strategy.apply_on_node node, game

          if currentResult != nil
            results.push currentResult
          end
      end

        puts "execute strategy"
      results.each do |r|
        r.execute game
      end
=begin
    if (results.length > 0)
        puts "execute strategy"
        r= results[0];
        puts ""
        puts ""
        puts " strategy_name = #{r.strategy_name}"
        puts " node = #{r.node}"
        puts " other_node = #{r.other_node}"
        puts " number_of_soldiers = #{r.number_of_soldiers} "
        puts ""
        puts ""
        r.execute game
    end

puts "execute strategy"

puts ""
puts ""
        puts " strategy_name = #{r.strategy_name}"
        puts " node = #{r.node}"
        puts " other_node = #{r.other_node}"
        puts " number_of_soldiers = #{r.number_of_soldiers} "
        puts ""
        puts ""
         r.execute game
        end
=end
#        results.sort_by { |r| -r[:points] }[0].execute game


    end

  end



end
















  def ramdom_move node, game
    node.adjacent_nodes.shuffle.each do |other_node|

      soldiers = rand(0..(node.available_soldiers))
      game.add_move(node, other_node, soldiers)
      return
    end
  end
