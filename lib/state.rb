class State
    @@state_list = {}
    @@state_info = {}

    def self.get_or_create_state_list
        if @@state_list == {}
            @@state_list = Api.get_states
        end
        @@state_list
    end

    def self.get_or_create_state_info(state)
        if !@@state_info.has_key?(state)
            @@state_info[state] = Api.get_covid_info_by_state(state)            
            @@state_info[state].name = @@state_list[state]
        end
        @@state_info[state]
    end

    def self.valid?(state_name)
        get_or_create_state_list.has_key?(state_name)
    end
end