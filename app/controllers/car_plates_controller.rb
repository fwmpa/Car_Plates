class CarPlatesController < ApplicationController
  def index
    @car_plates = CarPlateService::List.call(params.permit!)
  end

  def new
    build_new_view_data
  end

  def create
    CarPlateService::Create.call(permitted_params)

    redirect_to car_plates_path, notice: 'Placa criada com sucesso!'
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = e.message

    build_new_view_data

    render 'new'
  end

  def edit
    build_edit_view_data
  end

  def update
    CarPlateService::Update.call(fetch_car_plate, permitted_params)
    redirect_to car_plates_path, notice: 'Placa atualizada com sucesso!'
  rescue ActiveRecord::RecordInvalid => e
    flash[:alert] = e.message

    build_edit_view_data
    
    render 'edit'
  end

  def destroy
    car_plate = fetch_car_plate
    CarPlateService::Destroy.call(car_plate)
    success_message = "Placa '#{car_plate.plate}' deletada com sucesso!"
    
    redirect_to car_plates_path, notice: success_message
  end

  private

  def build_new_view_data
    @car_plate = CarPlate.new(car_plate_attributes)
  end

  def build_edit_view_data
    @car_plate = fetch_car_plate
    @car_plate.assign_attributes(car_plate_attributes)
  end

  def car_plate_attributes
    return {} if params[:car_plate].blank?

    params[:car_plate].to_hash
  end

  def permitted_params
    params.require(:car_plate).permit!
  end

  def fetch_car_plate
    CarPlateService::Fetch.call(params[:plate])
  end
end
