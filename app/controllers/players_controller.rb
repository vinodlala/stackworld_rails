class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update_attributes(player_params)
#    if @room.update_attributes(params[:room])
      redirect_to @player, :notice => "Player was edited successfully!"
    else
      render :action => "edit"
    end
  end

  def show
    begin
      @player = Player.find(params[:id])
    rescue
      @player = Player.first
    end
  end

  def create
    @player = Player.new(player_params)

    # @room = Room.find(@connection.starting_room_id)
    @room = Room.first

    if @player.save
      redirect_to @player, notice: "Player was created successfully!"
#      redirect_to @room, notice: "Player was created successfully!"

    else
      render :action => "new"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :description, :avatar_image, :player_id)
  end
end
