class Api::V1::OlympiansController < ApplicationController
  def index
    render json: {"olympians" => Olympian.all}
  end
end
