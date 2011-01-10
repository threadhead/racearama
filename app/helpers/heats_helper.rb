module HeatsHelper
  def enough_lanes?
    @heat.scouts.size <= @event.track.active_lanes_count
  end
end
