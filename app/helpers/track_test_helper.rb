module TrackTestHelper
  def lane_status_icon(status)
    if status == "open"
      image_tag "lane_open.png"
    else
      image_tag "lane_closed.png"
    end
  end
end
