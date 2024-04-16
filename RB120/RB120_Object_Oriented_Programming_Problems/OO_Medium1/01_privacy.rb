class Machine
  def start
    flip_switch(:on)     # self.flip_switch(:on) is okay in Ruby 2.7 or higher
  end

  def stop
    flip_switch(:off)    # self.flip_switch(:off) is okay in Ruby 2.7 or higher
  end

  def switch_status
    switch
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.stop
puts machine.switch_status