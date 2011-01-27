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
  
  def race_title(race)
    "Race ##{race.order_index} - #{race_class(race).titleize}"
  end
end
