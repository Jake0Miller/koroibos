class Api::V1::MedalistsController < ApplicationController
  def index
    render json: Event.medalists(params[:id])
  end
end
