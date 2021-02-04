# This class is doing all the API calls to the website that has the COVID information.
# The website is https://covidtracking.com/data/api
class Api  

    # get the list of states in a hash, where the key is the state code (e.g. WA) and the value is the name (e.g. Washington)
    def self.get_states
        response = HTTParty.get("https://api.covidtracking.com/v1/states/info.json")
        array = JSON.parse(response.body)
        result = {}
        array.each do |item|
            result[item["state"]] = item["name"]
        end
        result
    end

    # get specific statistics for a state. The information will be parsed as a JSON and used to create StateInfo object.
    def self.get_covid_info_by_state(state)
        response = HTTParty.get("https://api.covidtracking.com/v1/states/#{state.downcase}/current.json")
        StateInfo.new(JSON.parse(response.body))
    end

end