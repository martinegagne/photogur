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

    # def self.created_before(t
    #   Picture.where("created_at < ?"
    # end

end
