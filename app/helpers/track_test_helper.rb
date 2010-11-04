module TrackTestHelper
  def lane_status_icon(status)
    if status == "open"
      image_tag "lane_open.png"
    else
      image_tag "lane_closed.png"
    end
  end
  
  def milliseconds_to_s(milli)
    "#{number_with_precision(milli / 1000.0)}s"
  end
end
