class StateInfo
    attr_accessor :last_update_date, :total_positive_cases, :in_hospital, :last_day_positive, :total_deaths, :last_day_deaths
    attr_accessor :name

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
    end
end