class StateInfo
    attr_accessor :last_update_date, :total_positive_cases, :in_hospital, :last_day_positive, :total_deaths, :last_day_deaths
    attr_accessor :name

    def initialize(hash)
        @last_update_date = parse_date(hash["date"].to_s)
        @total_positive_cases = hash["positive"]
        @in_hospital = hash["hospitalizedCurrently"]
        @last_day_positive = hash["positiveIncrease"]
        @total_deaths = hash["death"]
        @last_day_deaths = hash["deathIncrease"]

        # we can't use the code below to set the variables because their name doesn't match the key names in the hash
        #hash.each do |key, value|
        #    self.send("#{key}=", value) if self.respond_to("#{key}=")
        #end
    end

    private
    def parse_date(date_string)
        # the date that we get from the API call looks like this: 20210202. We want to convert it
        # to MM/DD/YYYY        
        "#{date_string[4, 2]}/#{date_string[6, 2]}/#{date_string[0, 4]}"
    end
end