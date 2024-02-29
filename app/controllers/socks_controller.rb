class SocksController < ApplicationController
  def index
    @socks = Sock.all
  end

  def new
    @sock = Sock.new
  end

  def create
    @sock = Sock.new(sock_params)
    @sock.user = current_user
    @sock.save
    if @sock.save
      redirect_to sock_path(@sock), notice: "Sock was successfully created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def drawer
    @my_socks = current_user.socks
  end

  def edit
    @sock = Sock.find(params[:id])
  end

  def update
    @sock = Sock.find(params[:id])
    if @sock.update(sock_params)
      redirect_to @sock, notice: "Sock was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @sock = Sock.find(params[:id])
  end

  def destroy
    @sock = Sock.find(params[:id])
    @sock.destroy
    redirect_to root_path
  end

  private

  def sock_params
    params.require(:sock).permit(:title, :description, :price, :state, :color, :size, :photo)
  end
end
