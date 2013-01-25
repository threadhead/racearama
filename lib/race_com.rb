class RaceCom
  def self.do_race(track, duration)
    DaqController.send("start_race".to_sym, track.opts, duration)
    # ret[:result]#[:results]
  end


  def self.lane_status(track)
    DaqController.send("test_lanes".to_sym, track.opts)
    # ret[:result]#[:lane_status]
  end


  def self.gate_test(track, direction)
    DaqController.send("starting_gate_#{direction}".to_sym, track.opts)
  end


  # def self.get_settings(track)
  #   track
  # end


  def self.get_controller_status(track)
    puts "track: #{track.inspect}"
    DaqController.status(track.opts)
  end
end
