class Api::V1::OlympiansController < ApplicationController
  def index
    if params["age"].nil?
      render json: {"olympians" => Olympian.all.map(&:format_response)}
    elsif params["age"] == "youngest"
      render json: Olympian.youngest.map(&:format_response)
    elsif params["age"] == "oldest"

    end
  end
end
