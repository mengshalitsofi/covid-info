# This class has the list of states (code=>name) and each state information (state code=>info)
# The state list is to avoid API calls causing errors because the state is invalid.
# In order to not call the API every time for data that was already downloaded, the state_info is used
# to keep track of everything that was downloaded.
class State
    @@state_list = {}
    @@state_info = {}

    def self.get_or_create_state_list
        if @@state_list == {}
            # if we are here, the state_list is empty, which means we didn't
            # add it yet, so we need to call the API and add the list.
            @@state_list = Api.get_states
        end

        # here, we defintely already have the list of states
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