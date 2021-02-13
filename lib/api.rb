
# This class is doing all the API calls to the website that has the COVID information.
# The website is https://covidtracking.com/data/api
class Api  
    # get the list of states in a hash, where the key is the state code (e.g. WA) and the value is the name (e.g. Washington)
    def self.get_states
        response = HTTParty.get("https://api.covidtracking.com/v1/states/info.json")
        result = {}
        response.each do |item|
            result[item["state"]] = item["name"]
        end
        result
    end

    # get specific statistics for a state. The information will be parsed as a JSON and used to create StateInfo object.
    def self.get_covid_info_by_state(state)
        response = HTTParty.get("https://api.covidtracking.com/v1/states/#{state.downcase}/current.json")
        info_hash = {
            last_update_date: parse_date(response["date"].to_s),
            total_positive_cases: response["positive"],
            in_hospital: response["hospitalizedCurrently"],
            last_day_positive: response["positiveIncrease"],
            total_deaths: response["death"],
            last_day_deaths: response["deathIncrease"]
         }
        StateInfo.new(info_hash)
    end

    def self.parse_date(date_string)
        # the date that we get from the API call looks like this: 20210202. We want to convert it
        # to MM/DD/YYYY        
        "#{date_string[4, 2]}/#{date_string[6, 2]}/#{date_string[0, 4]}"
    end
end