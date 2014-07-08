class PinsController < ApplicationController
  before_action :authenticate_user!,  except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]





  def upvote
    @pin = Pin.find(params[:id])
    @pin.liked_by current_user
    if @pin.vote_registered?
      flash[:success] = "Pin Liked"
    end
    redirect_to pins_path
  end

  def downvote
    @pin = Pin.find(params[:id])
    @pin.downvote_from current_user
    if @pin.vote_registered?
      flash[:danger] = "Pin Disliked"
    end
    redirect_to pins_path
  end

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
  end


  def show
  end


  def new
    @pin = current_user.pins.build
  end


  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

      if @pin.save
       redirect_to @pin, notice: 'Pin was successfully created.' 
      else
       render :new 
      end
  end


  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
        render :show, status: :ok, location: @pin 
      else
      render :edit 
      end
  end


  def destroy
    @pin.destroy

      redirect_to pins_url, notice: 'Pin was successfully destroyed.' 
  end

  private

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
