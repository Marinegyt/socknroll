class RequestsController < ApplicationController
before_action :set_sock, only: %i[new create]
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.sock = @sock
    if @request.save
      redirect_to requests_path, notice: "Request was successfully created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @requests = Request.all
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to request_path(@request)
  end

  # def destroy
  # end

  private

  def set_sock
    @sock = Sock.find(params[:sock_id])
  end

  def request_params
    params.require(:request).permit(:start_date, :end_date, :user_msg, :price)
  end
end
