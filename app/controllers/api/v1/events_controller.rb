class Api::V1::EventsController < ApplicationController
  def index
    render json: {"events" => Event.all.group_by(&:sport).transform_values{|val| val.map(&:event)}}
  end
end
