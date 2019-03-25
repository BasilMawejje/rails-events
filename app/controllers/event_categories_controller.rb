class EventCategoriesController < ApplicationController
  def show
    @category = EventCategory.find(params[:id])
    @events = @category.events.all
  end
end
