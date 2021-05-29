#!/usr/bin/env ruby
require 'json'

first=1
second=1
nextterm=0
fib_arr = []
puts "Enter the number of terms:-"
n=gets.chomp.to_i

puts "The first #{n} terms of Fibonacci series are:-"
c=1
while(c<=n+1)
	if(c<=1)
		nextterm=c
	else
		#puts nextterm
		fib_arr << nextterm
		nextterm=first+second
		first=second
		second=nextterm
	end
	c+=1
	
end
#puts fib_arr.to_s
sum = 0
fib_arr.each { |a| sum+=a }
#puts sum

dictionary = { "member-count" => "#{n}", "sequence" => fib_arr.to_s, "total" => "#{sum}" }
puts JSON.pretty_generate(dictionary)
