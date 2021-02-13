class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address, :room_image).merge(user_id: @current_user.id))
    if @room.save
      flash[:notice] = "ルーム情報を登録しました"
      redirect_to room_path(@room)
    else
      render "new_room_path"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def index
    @room = @current_user.rooms.all
  end

  def search
    @rooms = Room.search_area(params[:search_area])
    @rooms = Room.search_keyword(params[:search_keyword])

  end
end
