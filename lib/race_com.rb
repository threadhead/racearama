class RaceCom
  def self.do_race(duration)
    DaqController.send("start_race".to_sym, get_settings.opts, duration)
    # ret[:result]#[:results]
  end
  
  
  def self.lane_status
    DaqController.send("test_lanes".to_sym, get_settings.opts)
    # ret[:result]#[:lane_status]
  end
  
  
  def self.gate_test(direction)
    DaqController.send("starting_gate_#{direction}".to_sym, get_settings.opts)
  end
  
  
  def self.get_settings
    Setting.first
  end
  
  
  def self.get_controller_status
    DaqController.status(get_settings.opts)
  end
end
