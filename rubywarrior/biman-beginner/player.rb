# Store the last known health in the instance variable @last_known_health
# use this variable to see if we're taking damage
class Player
  MIN_HEALTH = 15
  
  def play_turn(warrior)
    if warrior.feel.empty?
      if should_rest? warrior
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
    
    @last_known_health = warrior.health
  end
  
  private
  
  def should_rest? warrior
    # Don't worry too much about the next line
    @last_known_health = warrior.health unless @last_known_health
    safe = warrior.health >= @last_known_health
    bad_health = warrior.health < MIN_HEALTH
    safe && bad_health
  end
end