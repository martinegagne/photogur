class Picture < ApplicationRecord

  def self.newest_first
      Picture.order("created_at DESC")
    end

    def self.most_recent_five
      Picture.newest_first.limit(5)
    end

    def self.prev_month(time)
      Picture.where("created_at < ?", time)
    end

    def self.pictures_created_in_year(year)
      date_time = DateTime.new(year)
      start_date = date_time.beginning_of_year
      end_date = date_time.end_of_year

      Picture.where("created_at >= ? and created_at <=?", start_date, end_date)
    end

end
