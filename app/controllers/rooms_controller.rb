class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(room_params)
#    if @room.update_attributes(params[:room])
      redirect_to @room, :notice => "Room was edited successfully!"
    else
      render :action => "edit"
    end
  end

  def show
    begin
      @room = Room.find(params[:id])
    rescue
      @room = Room.first
    end
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: "Room was created successfully!"
    else
      render :action => "new"
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :background_image, :player_id)
  end
end
