require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'digest'
require 'cgi'

helpers do
  def e(text)
    Rack::Utils.escape_html(text)
  end
end

get '/' do
  @datas=Link.all
  erb :index
end

get '/send' do
  if Link.find_by(url: params[:url])==nil
    short_url = SecureRandom.urlsafe_base64(5)
    while short_url == Link.find_by(short_url: short_url).short_url do
      puts "create new short_url"
      short_url = SecureRandom.urlsafe_base64(5)
    end
    Link.create(url: params[:url], url_short: short_url)
    list = Link.where({url: params[:url]}).first
    data = {url: list.url,url_short: list.url_short}
    data.to_json
  else
    list = Link.where({url: params[:url]}).first
    data = {url: list.url,url_short: list.url_short}
    data.to_json
  end
end

get '/:url_short' do
  if Link.where({url_short: params[:url_short]}).first!=nil
    link=Link.where({url_short: params[:url_short]}).first
    redirect link.url
  else
    erb :error
  end
end