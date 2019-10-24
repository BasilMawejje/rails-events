class EventsController < ApplicationController
  def index
    @events = Event.order('name').page(params[:page]).per(15)
  end

  def show
    @event = Event.find(params[:id])
    category_events_count = -> (c) { EventCategory.all.select{|event_category| event_category.events.count > 10} }
    @popular_categories = EventCategory.all.map(&category_events_count).uniq.flatten.map(&:name)
  end
end
