class Api::V1::OlympiansController < ApplicationController
  def index
    render json: Olympian.search(params[:age])
  end
end
