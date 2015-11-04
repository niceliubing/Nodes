

class Strategy_result
    
   
   @node
   @other_node
   @number_of_soldiers
   @points
   @strategy_name
   
    def node 
       @node 
    end  
    def node=(node) 
       @node = node 
    end
    
    def other_node 
       @other_node 
    end  
    def other_node=(other_node) 
       @other_node = other_node 
    end
    
    def number_of_soldiers 
       @number_of_soldiers 
    end  
    def number_of_soldiers=(number_of_soldiers) 
       @number_of_soldiers = number_of_soldiers 
    end
    
    def points 
       @points 
    end  
    def points=(points) 
       @points = points 
    end
    
    def strategy_name 
       @strategy_name 
    end  
    def strategy_name=(strategy_name) 
       @strategy_name = strategy_name 
    end
   
   
    def execute game
    
      game.add_move(@node, @other_node, @number_of_soldiers)
       puts "#{@strategy_name} for node  #{@node}"
    end
end