class Api::V1::OlympianStatsController < ApplicationController
  def show
    render json: {"olympian_stats" => Olympian.stats}
  end
end
