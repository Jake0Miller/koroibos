class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = Olympian.all.map do |olympian|
      {
        name: olympian.name,
        team: olympian.team,
        age: olympian.age,
        sport: olympian.sport,
        total_medals_won: olympian.total_medals_won
      }
    end
    render json: {"olympians" => olympians}
  end
end
