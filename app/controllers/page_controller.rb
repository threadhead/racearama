class PageController < ApplicationController
  skip_before_filter :check_for_current_event

  def welcome
    render :welcome, layout: 'layouts/application_bootstrap'
  end

  def about
  end

  def copyright
  end

  def event_not_set
  end
end
