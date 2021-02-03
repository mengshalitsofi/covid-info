class CovidController
    def call
        puts "Welcome to the COVID-19 information center!"
        self.prompt_for_state
    end

    def prompt_for_state
        puts "Please enter your state (e.g. WA). Enter 'exit' to quit."
        input = ""
        loop do
            input = gets.strip.upcase            
            if input != 'EXIT' && !State.valid?(input)
                puts "Invalid state. Please try again."            
            else
                break
            end
        end
        
        if input != 'EXIT'
            state = input
            self.state_covid_options(state)
        end
    end

    def state_covid_options(state_name)
        state = State.get_or_create_state_info(state_name)

        puts "Viewing information for #{state.name} (last updated on #{state.last_update_date}):"
        puts "----------------------------------------------------------------"
        puts "Please choose from the following list of options:"
        puts "1. View total positive cases".green
        puts "2. View number of current hospitalized people".green
        puts "3. View last day's positive cases".green
        puts "4. View total death count".green
        puts "5. View last day's death count".green
        puts "6. Back to main menu\n".green
        
        self.user_selection(state, state_name)
    end

    def user_selection(state, state_name)
        input = gets.strip
        if input == "1"
            puts "Total positive cases in #{state.name} is #{state.total_positive_cases}".blue
            self.state_covid_options(state_name)
        elsif input == "2"
            puts "Number of current hospitalized people in #{state.name} is #{state.in_hospital}".blue
            self.state_covid_options(state_name)
        elsif input == "3"
            puts "Last day's positive cases in #{state.name} is #{state.last_day_positive}".blue
            self.state_covid_options(state_name)
        elsif input == "4"
            puts "Total death count in #{state.name} is #{state.total_deaths}".blue
            self.state_covid_options(state_name)
        elsif input == "5"
            puts "Last day's death count in #{state.name} is #{state.last_day_deaths}".blue
            self.state_covid_options(state_name)
        elsif input == "6"
            self.prompt_for_state
        else
            puts "Invalid selection.\n".red
            self.state_covid_options(state_name)
        end        
        
    end

end