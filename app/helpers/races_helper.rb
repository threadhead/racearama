module RacesHelper
  def active_lane?(lane)
    @active_lanes.include?(lane.to_s)
  end
  
  def lane_color(lane)
    active_lane?(lane) ? "green" : "red"
  end
  
  def race_class(race)
    if race.current
      "current"
    elsif race.completed
      "completed"
    else
      ""
    end
  end
end
