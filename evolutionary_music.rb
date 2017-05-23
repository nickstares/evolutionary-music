require 'rubygems'
require 'osc-ruby'

def osc(type, value)
	client = OSC::Client.new( "127.0.0.1", 7200 )
	client.send(OSC::Message.new(type, value))
end


	




class Composer
	attr_accessor :transposition, :crescendo, :dephasing, :rest1, :rest2, :rest3, :chords
	def initialize(transposition, crescendo, dephasing, rest1, rest2, rest3, chords)
		@transposition = transposition
		@crescendo = crescendo
		@dephasing = dephasing
		@rest1 = rest1
		@rest2 = rest2
		@rest3 = rest3
		@chords = chords
	end

	def attrs
		attributes = {}
    	instance_variables.map do |ivar| 
    		
    		attributes[ivar] = instance_variable_get ivar
    	end
    	return attributes
  	end


end

if File.exist?('db')
	composers = {}
	File.readlines('db').each do |line|

		hash = eval(line) # evaluate each line into a hash
	
		key = hash.keys[0] 
		value = hash.values[0]
		composers[key] = value
	end	
	
else
	composers = {}			

end

def save(composer, composers)
	db = File.open('db', 'a+')
	hash = {}
	hash[composers.key(composer)] = composer.attrs.values
	db.write(hash.to_s + "\n")
end

def reproduce(parent1, parent2)
	c = ['','','','','','','']
	a1 = parent1.attrs.values
	a2 = parent2.attrs.values
	r1 = rand(0..6)
	r2 = rand(0..6)
	r3 = rand(0..6)
	chance = rand(0..1)
	if chance == 1
		a1[r1] = c[r1]
		a2[r1] = ''
		a1[r2] = c[r2]
		a2[r2] = ''
		a1[r3] = c[r3]
		a2[r3] = ''
		a2.length.times do |i|
			if a2[i] != ''
				c[i] = a2[i]
			end
		end
	else
		a2[r1] = c[r1]
		a1[r1] = ''
		a2[r2] = c[r2]
		a1[r2] = ''
		a2[r3] = c[r3]
		a1[r3] = ''
		a1.length.times do |i|
			if a1[i] != ''
				c[i] = a1[i]
			end
		end
	end
	c = Composer.new(*c) #pass the array as an argument using *
	return c
end



def rand_t
	t = rand()
	t = t.to_f.round(1).to_s
	return t
end

def rand_r
	s = ""
	7.times do |i|
		t = rand()
		t = t.to_f.round(1).to_s	
		s << t
		if i != 6
			s << " "
		end
	end
	return s
end

def rand_ch
	s = ""
	9.times do |i|
		t = rand(-2000..2000).round(-2).to_s
		
		s << t
		if i !=8
			s << " "
		end
	end
	return s
end


if !File.exist?('db')
	10.times do |i|
		name = "composer" << (i+1).to_s
		c = Composer.new(rand_t(), rand_t(), rand_t(), rand_r(), rand_r, rand_r, rand_ch)
			composers[name] = c
			save(c, composers)
		

	end
end





case ARGV[0]
	when "names"
		puts composers.keys
	when "listen"
		if composers[ARGV[1]].nil?
			puts "Composer name not found"
		else
				hash = {}
				composer = Composer.new(*composers[ARGV[1]])
				
				composer.attrs.each do |key, value|
					key = key.to_s
					key[0] = '' # remove the @
					route = "/" + key
					osc(route, value)
				end

			puts "Created a composer with the following attributes: #{composer.attrs} "
		end
	when "reproduce"
		if composers[ARGV[1]].nil? or composers[ARGV[2]].nil?
			puts "One or more of the composers you specified were not found. Please try again."
		else
			puts "Please name the child composer:"
			name = STDIN.gets.chomp

			parent1 = Composer.new(*composers[ARGV[1]])
			parent2 = Composer.new(*composers[ARGV[2]])
			child = reproduce(parent1, parent2)
			composers[name] = child
			save(child, composers)
			
			puts "Congratulations! #{name} has been born with the following attributes: #{child.attrs}"
		end
	when "erase_db"
		puts "Erasing database."
		File.delete('db')
	else 
		puts "Please type an appropriate command. See the README for information about commands."
end



