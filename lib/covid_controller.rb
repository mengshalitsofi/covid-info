class CovidController
    def call
        puts "Welcome to the COVID-19 information center!"
        self.prompt_for_state
    end

    def prompt_for_state
        puts "\nTo get started, please enter your state (e.g. WA):"
        input = gets.strip
    end
end