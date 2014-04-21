module DateUtils
  class << self
    def parse_date(d)
      x = DateTime.strptime(d, '%m/%d/%Y')
      Time.zone.local_to_utc(x).in_time_zone(Time.zone)
    end
  end
end