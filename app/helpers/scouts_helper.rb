module ScoutsHelper
  def check_in?
    @mode == "check_in"
  end
  
  def events_for_scout(scout)
    scout.events.order("start_time DESC").map { |event|
      if event.active
        content_tag :strong, "#{event.name} &laquo; Active".html_safe
      else
        "#{event.name} &raquo; archived"
      end
    }.join("<br />").html_safe
  end
end
