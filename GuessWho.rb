class Suspect
	attr_accessor :name, :hair, :skin_color, :gender, :eye_color

	def initialize(name, hair, skin_color, gender, eye_color)
		@name = name
		@hair = hair
		@skin_color = skin_color
		@gender = gender
		@eye_color = eye_color
	
	end

end



class GuessWho
	attr_accessor :count
	attr_reader :suspect_1, :suspect_2, :suspect_3, :suspect_4, :suspect_5
	attr_reader :suspect_6, :suspect_7, :suspect_8, :suspect_9, :suspect_10
	attr_reader :suspect_11, :suspect_12, :suspect_13, :suspect_14, :suspect_15, :culprit
	attr_reader :suspect_16, :suspect_17, :suspect_18, :suspect_19, :suspect_20, :suspect_21
	attr_accessor :suspect_list
	

	def initialize
		@count = 0
		@suspect_1 = Suspect.new("Rachel", "auburn", "black", "girl", "brown")
		@suspect_2 = Suspect.new("Mac", "black", "white", "boy", "brown")
		@suspect_3 = Suspect.new("Nick", "brown", "white", "boy", "blue")
		@suspect_4 = Suspect.new("Angie", "auburn", "white", "girl", "green")
		@suspect_5 = Suspect.new("Theo", "blonde", "white", "boy", "brown")
		@suspect_6 = Suspect.new("Joshua", "black", "white", "boy", "brown")
		@suspect_7 = Suspect.new("Emily", "blonde", "white", "girl", "blue")
		@suspect_8 = Suspect.new("Jason", "blonde", "white", "boy", "green")
		@suspect_9 = Suspect.new("John", "brown", "white", "boy", "blue")
		@suspect_10 = Suspect.new("Grace", "black", "black", "girl", "brown")
		@suspect_11 = Suspect.new("Jake", "brown", "white", "boy", "brown")
		@suspect_12 = Suspect.new("Megan", "blonde", "white", "girl", "green")
		@suspect_13 = Suspect.new("Ryan", "auburn", "white", "boy", "brown")
		@suspect_14 = Suspect.new("Brandon", "blonde", "white", "boy", "brown")
		@suspect_15 = Suspect.new("Beth", "blonde", "white", "girl", "brown")
		@suspect_16 = Suspect.new("Diane", "brown", "white", "girl", "brown")
		@suspect_17 = Suspect.new("Chris", "black", "white", "boy", "green")
		@suspect_18 = Suspect.new("David", "black", "black", "boy", "brown")
		@suspect_19 = Suspect.new("Michelle", "brown", "black", "girl", "brown")
		@suspect_20 = Suspect.new("Tyson", "black", "black", "boy", "brown")
		@suspect_21 = Suspect.new("Ursula", "auburn", "white", "girl", "green")
		@suspect_list = [@suspect_21, @suspect_20, @suspect_19, @suspect_18, @suspect_17, @suspect_16, @suspect_15, @suspect_14, @suspect_13, @suspect_12, @suspect_11,
			@suspect_10, @suspect_9, @suspect_8, @suspect_7, @suspect_6, @suspect_5, @suspect_4, @suspect_3, @suspect_2, @suspect_1]
		@culprit = @suspect_list.sample	
	end



	def show_suspects
		puts "Here's a list of the suspects:"
		puts"|Name|Gender|Skin Color|Eye Color|Hair"
		suspect_list.each do |suspect|
			puts "#{suspect.name}, #{suspect.gender}, #{suspect.skin_color}, #{suspect.eye_color}, #{suspect.hair}"
		end
		winning_guess
	end

	def winning_guess
		puts "Do you want to guess the culprit's name? Yes or no?"

		answer = gets.chomp.downcase

		if answer == "yes"
			puts "Let a rip"
			answer = gets.chomp.capitalize
			case
			when answer == culprit.name
				puts "Damn! Well done. Game over"
				exit
			else 
				self.count = count + 1
				puts "Long shot. Sorry mate."
				whats_the_count
			end
		else
			
			puts "Ok then, moving on."
		end
	end

	def whats_the_count

		if count == 1 
			puts "You only have two more guesses"
		elsif count == 2
				puts "Uh oh, only one more guess!"
		else 
			
			puts "You're out of guesses! Better guess a name"
			answer = gets.chomp.capitalize
			case 
			when answer == culprit.name
				puts "Oh ya! Well done!"
				exit
			else 
				puts "Game over yo, try again. The culprit was #{culprit.name}"
				
			end
		end
	end
				
	

	def game

		puts "Let's play a game. It's called Guess Who. Want to play? Yes or no?"

		answer = gets.chomp.downcase

		if answer == "yes"
			puts "Ok fun! I will provide you a list of suspects complete with details about their appearance. You have three guesses to find out who the culprit is."
			puts "Choose an attribute from the following list: Hair, Name, Gender, Skin Color, Eye Color. Then guess the respective color of the attribute or gender of the culprit, or even the name if you're feeling lucky."
			puts "If at any point, you'd like to guess a name, just type name!"
			
			puts "ok? yes or no?"
			answer = gets.chomp.downcase

			if answer == "yes"

				puts show_suspects

				while count < 3

					puts "Choose an attribute"

					attribute = gets.chomp.split.map(&:capitalize).join(' ')

					if attribute == "Name"
						puts "ok choose a name"
						answer = gets.chomp.capitalize
						if answer != culprit.name
							self.count = count + 1
							suspect_list.delete(answer)
							puts "Nice try bud. Here's an updated list of remaining suspects for your next guess:"
							puts suspect_list.map {|x| x.name}
							
							
						else
							puts "Way to go! The culprit was #{culprit.name}"
							exit
					
						end
						whats_the_count
					end					

					if attribute == "Hair"
						puts "Guess a color: Black, Brown, Blonde, Auburn"
						answer = gets.chomp.downcase
						case 
						 when answer == culprit.hair
						 	self.count = count + 1
						 	puts "Well done, the culprit does have #{answer} hair. Here's an updated list of remaining suspects for your next guess:"
						 	suspect_list.delete_if {|x| x.hair != culprit.hair}
						 	puts suspect_list.map {|x| x.name}
						 	
						 	  
						 else
						 	self.count = count + 1
						 	puts "Nope. Sorry. Here's an updated list of remaining suspects for your next guess:" 
						 	suspect_list.delete_if {|x| x.hair == answer}
						 	puts suspect_list.map {|x| x.name}
						 	
						 end

						 whats_the_count
						
					end

					
					if attribute == "Eye Color"
						puts "Guess a color: Blue, Green, Brown"
						answer = gets.chomp.downcase
						case 
						when answer == culprit.eye_color
							self.count = count + 1
							puts "Well done, the culprit does have #{answer} eyes. Here's an updated list of remaining suspects for your next guess:"
							puts suspect_list.map {|x| x.name}
							
							
						else
							self.count = count + 1
							puts "Nope. Sorry. Here's an updated list of remaining suspects for your next guess:"  
							suspect_list.delete_if {|x| x.eye_color == answer}
						 	puts suspect_list.map {|x| x.name}
						 	
						end

						whats_the_count
					
					end

					if attribute == "Gender"
						puts "Guess a gender: Boy or Girl?"
						answer = gets.chomp.downcase
						case 
						when answer == culprit.gender
							self.count = count + 1
							puts "Well done, the culprit is a #{answer}. Here's an updated list of remaining suspects for your next guess:"
							suspect_list.delete_if {|x| x.gender != culprit.gender}
							puts suspect_list.map {|x| x.name}
							
							
						else
							self.count = count + 1
							puts "Nope. Sorry. Here's an updated list of remaining suspects for your next guess:"
							suspect_list.delete_if {|x| x.gender == answer}
						 	puts suspect_list.map {|x| x.name}
							
						end

						whats_the_count

					end

					if attribute == "Skin Color"
						puts "Guess a skin color: Black or White?"
						answer = gets.chomp.downcase
						case 
						when answer == culprit.skin_color
							self.count = count + 1
							puts "Well done, the culprit is #{answer}. Here's an updated list of remaining suspects for your next guess:"
							suspect_list.delete_if {|x| x.skin_color != culprit.skin_color}
							puts suspect_list.map {|x| x.name}
							
						else
							self.count = count + 1
							puts "Nope. Sorry. Here's an updated list of remaining suspects for your next guess:"
							suspect_list.delete_if {|x| x.skin_color == answer}
						 	puts suspect_list.map {|x| x.name}
							
						end
						whats_the_count
						
					end
				end # end of while loop
						
			end # end of "ok? == yes"

		end # end of "do you wana play"

	end # end of game method	
end # end of GuessWho class

new_game = GuessWho.new

new_game.game








