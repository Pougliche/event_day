class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

      if @event.save
       redirect_to @event, notice: 'Event was successfully created.' 
      else
        render :new 
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.' 
      else
        render :edit 
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    
    redirect_to events_url, notice: 'Event was successfully destroyed.' 
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    #def event_params
      #params.fetch(:event, {})
    #end

    def event_params
      params.require(:event).permit(:title, :description, :duration, :location, :price, :start_date)
    end
end
