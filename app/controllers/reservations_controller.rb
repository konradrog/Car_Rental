class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)

    if @reservation.new_record?
      render "new"
    else
      redirect_to reservations_path(@reservation)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @car = Car.find(@reservation.car_id)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy

    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :surname, :e_mail, :from_date, :to_date, :car_id)
  end
end
