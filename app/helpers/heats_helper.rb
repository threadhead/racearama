module HeatsHelper
  def enough_lanes?
    @heat.scouts.size <= @event.track.active_lanes_count
  end
  
  def any_races_current?
    @heat.races.current.count > 0
  end
  
  def next_race_to_stage
    # find the first, non-completed, non-staged race that is ready to stage
    @heat.races.not_completed.not_current.by_index.first
  end
end
