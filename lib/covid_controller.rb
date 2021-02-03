class CovidController
    def call
        puts "Welcome to the COVID-19 information center!"
        self.prompt_for_state
    end

    def prompt_for_state
        puts "\nTo get started, please enter your state (e.g. WA). Enter 'exit' to quit."
        states = State.get_or_create_state_list
        loop do
            input = gets.strip.upcase            
            if input != 'EXIT' && !states.include?(input)
                puts "Invalid state. Please try again."            
            else
                break
            end
        end
        
        if input != 'EXIT'
            state = input


        end
        #new _state = Api.get_covid_info_by_state(state)
        #self.state_covid_options
    end

    def state_covid_options(state)
        puts "please choose from the following list for covid information for #{state}"
        puts "1. last_update_date"
        puts "2. total_positive_cases"
        puts "3. in_hospital"
        puts "4. last_day_positive"
        puts "5. total_deaths"
        puts "6. last_day_deaths"

        self.user_selection(state)
    end

    def user_selection(state)
        input = gets.strip
        if input == "1" || input.include?("last")
            puts "the last_update_cases in #{state} is #{state.date}"
        elsif input == "2"
            puts "the total_positive_cases in #{state} is #{state.positive}"
        elsif input == "3"
            puts "in_hospital in #{state} is #{state.hospitalizedCurrently}"
        elsif input == "4"
            puts "last_day_positive in #{state} is #{state.positiveIncrease}"
        elsif input == "5"
            puts "the total_deaths in #{state} is #{state.death}"
        elsif input == "6"
            puts "last_day_deaths in #{state} is #{state.deathIncrease}"
        else
            puts "That selection was invalid."
            self.state_covid_options(state)
        end
        
    end

end