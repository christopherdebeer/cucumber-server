#!/usr/bin/env ruby

require 'sinatra'
set :port, 4000

get '/' do 
	echo "hellow from ruby and sinatra"
end
