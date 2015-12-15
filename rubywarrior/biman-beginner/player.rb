
class Player
MIN_HEALTH = 15
  def play_turn(warrior)

    # cool code goes here
    if warrior.feel.empty? 
      
        if should_rest? (warrior)
          warrior.rest!
        else

        warrior.walk!
      end
    elsif warrior.feel.captive?
        warrior.rescue!
    else 
        warrior.attack!
    end
    
    @last_known_health = warrior.health
  end

  def should_rest? (warrior)
      # Following two lines are the same
      # @last_known_health ||= warrior.health
      @last_known_health = warrior.health unless @last_known_health 
      # warrior.health  < MIN_HEALTH && (@last_known_health <= warrior.health)
      safe = @last_known_health <= warrior.health
      bad_health = warrior.health  < MIN_HEALTH
      safe && bad_health 
  end
end