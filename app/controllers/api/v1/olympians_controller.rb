class Api::V1::OlympiansController < ApplicationController
  def index
    if params["age"].nil?
      render json: {"olympians" => Olympian.all.map(&:format_response)}
    elsif params["age"] == "youngest"
      render json: Olympian.by_age(:ASC).map(&:format_response)
    elsif params["age"] == "oldest"
      render json: Olympian.by_age(:DESC).map(&:format_response)
    end
  end
end
