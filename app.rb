require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'digest'

get '/' do
  @datas=Link.all
  erb :index
end

get '/send_url' do
  if Link.find_by(url: params[:url])==nil
    Link.create(url: params[:url], url_short: Digest::MD5.hexdigest(params[:url]))
  end
  @link=Link.where({url: params[:url]}).first
  erb :result
end

get '/:url_short' do
  link=Link.where({url_short: params[:url_short]}).first
  redirect link.url
end