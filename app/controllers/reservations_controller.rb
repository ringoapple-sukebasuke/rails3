class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end


  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @current_user.id 
    @room = Room.find(params[:id])
    @reservation.room_id = @room.id
    @reservation.room_name = @room.room_name
    @reservation.room_image = @room.room_image
    @reservation.room_introduction = @room.room_introduction
    render :confirm if @reservation.invalid?
    @reservation.total_price = @room.room_price * @reservation.people * (@reservation.end_day.to_date - @reservation.start_day.to_date).to_i
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @current_user.id
    if @reservation.save
      redirect_to controller: reservations_path
    else
      flash[:notice] = "エラーが発生しました。確認してください"
      render :confirm
    end
  end
    

  def show
    @reservation = Reservation.find(params[:id])
  end





  private
  
  def reservation_params    
    params.require(:reservation).permit(:user_id, :room_id,:room_name,:room_image,:room_introduction, :start_day, :end_day, :people ,:total_price)    
  end
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_address)
  end
end
