class Api::V1::MedalistsController < ApplicationController
  def index
    event = Event.includes(:olympians).where(id: params[:id])[0]
    medals = event.olympian_events.where(medal: ['Gold', 'Silver', 'Bronze'])
    olympians = medals.map do |medal|
      olympian = medal.olympian
      {name: olympian.name, team: olympian.team, age: olympian.age, medal: medal.medal}
    end
    
    render json: {"event" => event.event, "medalists" => olympians}
  end
end
