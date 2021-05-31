#!/usr/bin/env ruby
require 'json'

first_ele=1
second_ele=1
next_term=0
fib_arr = []
puts "Please enter then number (1-100) of terms for Finbonacci Sequence generation:"
n=gets.chomp.to_i

if (n < 1 || n > 100)
puts "Wrong Sequence Number Provided !!! Sequence Number need to be from 1 to 100"
exit (1)
end


counter=1
while(counter<=n+1)
	if(counter<=1)
		next_term=counter
	else
		fib_arr << next_term
		next_term=first_ele+second_ele
		first_ele=second_ele
		second_ele=next_term
		
	end
	counter+=1
	
end

sum = 0
fib_arr.each { |a| sum+=a }

puts "The #{n} term/s of Fibonacci Sequence is/are:"
dictionary = { "member-count" => "#{n}", "sequence" => fib_arr.to_s, "total" => "#{sum}" }
puts JSON.pretty_generate(dictionary)
