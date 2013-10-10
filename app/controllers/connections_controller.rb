class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def edit
    @connection = Connection.first
    # @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])

    if @connection.update_attributes(connection_params)
#    if @room.update_attributes(params[:room])
      redirect_to @room, :notice => "Connection was edited successfully!"
    else
      render :action => "edit"
    end
  end

  def show
    begin
      @connection = Connection.find(params[:id])
    rescue
      @room = Room.first
    end
  end

  def create
    @connection = Connection.new(connection_params)

    @room = Room.find(@connection.starting_room_id)
#    @room = Room.find(params[:starting_room_id])

    if @connection.save
      redirect_to @room, notice: "Connection was created successfully!"
    else
      render :action => "new"
    end
  end

  private

  def connection_params
    params.require(:connection).permit(:starting_room_id, :ending_room_id, :connection_name)
  end
end

