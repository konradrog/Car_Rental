class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @cars = Car.all.order(:brand)
  end

  def create
    @cars = Car.all.order(:brand)
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

  def edit
    @reservation = Reservation.find(params[:id])
    @cars = Car.all.order(:brand)
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render "edit"
    end
  end

  def search
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :surname, :address,
    :e_mail, :from_date, :to_date, :car_id, :phone_number)
  end
end
