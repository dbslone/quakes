require 'csv'

class NearbyController < ApplicationController
  def index
    start_date = Date.parse(params[:startDate])
    end_date = Date.parse(params[:endDate])

    start_date2 = Date.parse('2017-03-24')
    end_date2 = Date.parse('2017-04-24')

Rails.logger.info("start: #{start_date} :: #{start_date2}")
    quakes_felt = []

    CSV.foreach('public/all_month.csv', headers: true) do |row|
      quake_date = Date.parse(row[0])

      if quake_date >= start_date && quake_date <= end_date
        lat = row[1].to_f
        long = row[2].to_f.abs

        haversine = Haversine.new(ENV['LAT'], ENV['LONG'], ENV['RADIUS'])
        total_distance = haversine.distance(lat, long)
        magnitude_distance = row[4].to_f * 100
        if magnitude_distance >= total_distance
          quakes_felt << {
            location: row[13],
            lat: lat,
            long: long,
            distance: total_distance,
            date: quake_date,
            magnitude: row[4]
          }
        end
      end
    end

    render json: quakes_felt.first(10)
  end
end
