class RequestsController < ApplicationController
  before_action :set_sock, only: %i[new create]
  before_action :set_request, only: %i[edit update destroy show accept reject]

  def new
    @request = Request.new
  end

  def show
    @sock = @request.sock
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
    @requests = current_user.requests
    @owner_requests = current_user.owner_requests
  end

  def accept
    @request.status = "accepted"
    @request.save
    redirect_to request_path(@request), notice: "Le request a été accepté"
  end

  def reject
    @request.status = "rejected"
    @request.save
    redirect_to requests_path(@request), notice: "Le request a été refusé"
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    if @request.update(request_params)
      redirect_to requests_path(@request), notice: "Request was successfully updated.", status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_path(@request)
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
