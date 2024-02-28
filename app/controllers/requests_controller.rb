class RequestsController < ApplicationController
  before_action :set_sock, only: %i[new create]
  before_action :set_request, only: %i[edit update destroy show]

  def new
    @request = Request.new
  end

  def show
    @sock = @request.sock
  end

  def create
    @request = Request.new
    @request.sock = @sock
    if @request.save
      redirect_to request_path(@request), notice: "Request was successfully created"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @request.update(request_params)
    redirect_to request_path(@request)
  end

  def destroy
    @request.destroy
    redirect_to root_path
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def set_sock
    @sock = Sock.find(params[:sock_id])
  end

  def request_params
    params.require(:request).permit(:start_date, :end_date, :user_msg)
  end
end
