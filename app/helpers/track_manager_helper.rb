module TrackManagerHelper
  def current_event_set_icon
    if @event
      image_tag "ok.png"
    else
      image_tag "error.png"
    end
  end
  
  def track_set_icon
    if @event.track
      image_tag "ok.png"
    else
      image_tag "error.png"
    end
  end
  
end
