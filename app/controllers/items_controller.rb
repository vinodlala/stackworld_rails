class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def edit
    @item = Item.first
    # @item = Item.all
#    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
#    if @room.update_attributes(params[:room])
      redirect_to @item, :notice => "Item was edited successfully!"
    else
      render :action => "edit"
    end
  end

  def show
    begin
      @item = Item.find(params[:id])
    rescue
      @item = Item.first
    end
  end

  def create
    @item = Item.new(item_params)

    @room = Room.find(@item.room_id)
    if @item.save
      redirect_to @room, notice: "Item was created successfully!"
    else
      render :action => "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url, :room_id, :x_coord, :y_coord)
  end
end
