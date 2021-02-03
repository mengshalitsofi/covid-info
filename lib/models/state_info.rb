class StateInfo
    attr_accessor :last_update_date, :total_positive_cases, :in_hospital, :last_day_positive, :total_deaths, :last_day_deaths

    def initialize(hash)
        last_update_date = hash["date"]
        total_positive_cases = hash["positive"]
        in_hospital = hash["hospitalizedCurrently"]
        last_day_positive = hash["positiveIncrease"]
        total_deaths = hash["death"]
        last_day_deaths = hash["deathIncrease"]

        # we can't use the code below to set the variables because their name doesn't match the key names in the hash
        #hash.each do |key, value|
        #    self.send("#{key}=", value) if self.respond_to("#{key}=")
        #end
    end

end