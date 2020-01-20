class EventsController < ApplicationController
  def index
    @events = Event.order('name').page(params[:page]).per(15)
  end

  def show
    @event = Event.find(params[:id])
    category_events_count = -> (c) { EventCategory.all.sample(10).lazy.select{|event_category| event_category.events.count > 15 }.take(5).to_a }
    @popular_categories = EventCategory.all.lazy.flat_map(&category_events_count).take(4).to_a.map(&:name)
  end
end
