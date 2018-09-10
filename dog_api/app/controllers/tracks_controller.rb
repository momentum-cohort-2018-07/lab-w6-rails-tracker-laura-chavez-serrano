class TracksController < ApplicationController
  before_action :set_dog, only: [:show, :update, :destroy]

  
  def index
    @dogs = Dog.all

    render json: @dogs
  end

 
  def show
    render json: @dog
  end


  
  def create
   
    @dog = Dog.new(dog_params)

    if @dog.save
      render json: @dog, status: :created
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

 
  def update
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params
      # params.require(:dog).permit(:name, :status) because my controller is tracks
      params.require(:track).permit(:name, :status)
    end
end