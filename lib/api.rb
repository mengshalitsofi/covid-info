class Api

    def self.get_states
        response = HTTParty.get("https://api.covidtracking.com/v1/states/info.json")
        array = JSON.parse(response.body)
        array.map{|state_info|state_info["state"]}
    end

    def self.get_covid_info_by_state(state)
        response = HTTParty.get("https://api.covidtracking.com/v1/states/#{state.downcase}/current.json")
        StateInfo.new(JSON.parse(response.body))
    end

end