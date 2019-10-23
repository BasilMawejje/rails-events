class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    category_events_count = -> (c) { EventCategory.all.select{|x| x.events.count > 10} }
    @popular_categories = EventCategory.all.map(&category_events_count).uniq.flatten.map(&:name)
  end
end
