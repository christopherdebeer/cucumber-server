#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'

enable :sessions

class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end

get '/' do
    @posts = Post.order("created_at DESC")
    @title = "cucumber-server"
    erb :"posts/index"
end

get '/posts/:id' do
  @post = Post.find( params[:id] )
  @title = @post.title
  erb :"posts/view"
end

get '/post/create' do
  @title = 'Create post'
  @post = Post.new
  erb :"posts/create"
end

post '/posts' do
  @post = Post.new( params[:post] )
  if @post.save
    flash[:notice] = 'post created sucessfully.'
    redirect "posts/#{@post.id}"
  else
    flash[:error] = 'Oops, try again.'
    erb :"posts/create"
  end
end

helpers do
  def title
    @title or "Welcome."
  end
end
      
