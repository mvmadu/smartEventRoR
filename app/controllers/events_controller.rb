class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  def user_events
    e = []
    Events.all.each {|event|
      if event.user_id == current_user.id
        e.push(event)
      end
    }
    format.json { render :json => e.map, :include => [:id, :title, :description, :user_id, :start, :end, :url]}
  end

  # GET /events/1
  # GET /events/1.json
  def show
    
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
      @event.user_id = current_user.id
      respond_to do |format|
        if @event.save
         if params[:photos]
            params[:photos].each { |image|
              @event.pictures.create(photo: image)
            }
          end
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
 
def update
    respond_to do |format|
      if @event.update(event_params)
        if params[:photos]
          params[:photos].each { |image|
            @event.pictures.create(photo: image)
          }
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    if params[:destroy_images].present?
      @event.picture.each{|p| p.destroy}
    end
  end




  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if @event.user_id == current_user.id
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to events_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :start_time, :end_time, :description, :picture_objects)
    end
end
