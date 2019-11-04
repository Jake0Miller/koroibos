require 'csv'

task :import => [:environment] do
  olympian_file = "db/csv/olympians.csv"

  CSV.foreach(olympian_file, :headers => true) do |row|
    row = row.to_hash
    olympian = Olympian.create!(name: row['Name'], sex: row['Sex'], age: row['Age'], height: row['Height'], weight: row['Weight'], team: row['Team'], sport: row['Sport'])
    event = Event.create!(event: row['Event'])
    OlympianEvent.create!(medal: row['Medal'], olympian: olympian, event: event)
  end
  p "Olympians imported"
end
