# Simple Action that fails the work unit until it is just about to exhaust
# all of its retries.
class FailureTesting < Dogpile::Action
  
  def run
    if options['attempts'] + 1 >= Dogpile::CONFIG['work_unit_retries']
      return 'made it!'
    else
      raise 'hell'
    end    
  end
  
end