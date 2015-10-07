class Suspect
	attr_accessor :name, :hair, :skin_color, :gender, :eye_color
	attr_reader :suspect_1, :suspect_2, :suspect_3, :suspect_4, :suspect_5
	attr_reader :suspect_6, :suspect_7, :suspect_8, :suspect_9, :suspect_10
	attr_reader :suspect_11, :suspect_12, :suspect_13, :suspect_14, :suspect_15, :culprit
	attr_reader :suspect_16, :suspect_17, :suspect_18, :suspect_19, :suspect_20, :suspect_21
	attr_accessor :suspect_list

	def initialize(name, hair, skin_color, gender, eye_color)
		@name = name
		@hair = hair
		@skin_color = skin_color
		@gender = gender
		@eye_color = eye_color
	

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

end



class GuessWho
	attr_accessor :suspect, :count
	

	def initialize
		@count = 0
		@suspect = Suspect.new
	
		show_suspects
		
	end



	def show_suspects
		puts "Here's a list of the suspects:"
		suspect.suspect_list.each do |suspect|
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
			when answer == suspect.culprit.name
				puts "Damn! Well done. Game over"
				exit
			else 
				puts "Long shot. Sorry mate."
				count += 1
			end
		else
			puts "Ok then, moving on."
		end
	end
	

	def game

		

			puts "Let's play a game. It's called Guess Who. Want to play? Say yes or no."

			answer = gets.chomp

			if answer == "yes"
				puts "Ok fun! I will provide you a list of suspects complete with details about their appearance. You have three guesses to find out who the culprit is."
				puts "Choose an attribute from the following list: Hair, Name, Gender, Skin Color, Eye Color. Then guess the respective color of the attribute or gender of the culprit, or even the name if you're feeling lucky."
				
				puts show_suspects

				while count < 3

					puts "Choose an attribute"

					attribute = gets.chomp.capitalize

					

					if attribute == "Hair"
						puts "Guess a color: Black, Brown, Blonde, Auburn"
						answer = gets.chomp.downcase
						case 
						 when answer == suspect.culprit.hair
						 	self.count += 1
						 	puts "Well done, the culprit does have #{answer} hair. Here's an updated list for your next guess, #{3 - count} more guesses!"
						 	puts suspect.suspect_list.delete_if {|x| x.hair != suspect.culprit.hair}.map {|x| x.name && x.hair}
						 	
						 	  
						 else
						 	self.count += 1
						 	puts "Nope. Sorry. Here's an updated list for your next guess, #{3 - count} more guesses!" 
						 	puts suspect.suspect_list.delete_if {|x| x.hair != suspect.culprit.hair}.map {|x| x.name && x.hair}
						 end

						 

						 puts "Choose an attribute again" 
						
					end

					if attribute == "Eye Color"
						puts "Guess a color: Blue, Green, Brown"
						answer = gets.chomp.downcase
						case 
						when answer == suspect.culprit.eye_color
							puts "Well done, the culprit does have #{answer} eyes. Here's an updated list for your next guess, #{3 - count} more guesses!"  
							puts suspect_list.delete_if {|x| x.eye_color != suspect.culprit.eye_color}.map {|x| x.name && x.eye_color}
							count += 1
							
						else
							puts "Nope. Sorry. Here's an updated list for your next guess, #{3 - count} more guesses!"  
							puts suspect.suspect_list.delete_if {|x| x.eye_color != suspect.culprit.eye_color}.map {|x| x.name && x.eye_color}
							count += 1
						end
						

						puts "choose another attribute"

					end

					if attribute == "Gender"
						puts "Guess a gender: Boy or Girl?"
						answer = gets.chomp.downcase
						case 
						when answer == suspect.culprit.gender
							puts "Well done, the culprit is a #{answer}. Here's an updated list for your next guess, #{3 - count} more guesses!" 
							puts suspect.suspect_list.delete_if {|x| x.gender != suspect.culprit.gender}.map {|x| x.name && x.gender}
							count += 1
							
						else
							puts "Nope. Sorry. Here's an updated list for your next guess, #{3 - count} more guesses!"  
							puts suspect.suspect_list.delete_if {|x| x.gender != suspect.culprit.gender}.map {|x| x.name && x.gender}
							count += 1
							
						end

						

						puts "choose another attribute"
						
					end

					if attribute == "Skin Color"
						puts "Guess a skin color: Black or White?"
						answer = gets.chomp.downcase
						case 
						when answer == suspect.culprit.skin_color
							puts "Well done, the culprit is #{answer}. Here's an updated list for your next guess, #{3 - count} more guesses!" 
							puts suspect_list.delete_if {|x| x.skin_color != suspect.culprit.skin_color}.map {|x| x.name && x.skin_color}
							count += 1
							
						else
							puts "Nope. Sorry. Here's an updated list for your next guess, #{3 - count} more guesses!" 
							puts suspect.suspect_list.delete_if {|x| x.skin_color != suspect.culprit.skin_color}.map {|x| x.name && x.skin_color}
							count += 1
							
						end
						
					end
					break if count == 3
					puts "Game over! No more guesses!"
					exit
				end
		
		end

	end # end of game method	

end # end of GuessWho class

new_game = GuessWho.new






