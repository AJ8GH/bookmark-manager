require 'sinatra'
require 'sinatra/flash'
require 'uri'
require './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  configure do
    enable   :sessions
    set      :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    valid_url = Bookmark.create(title: params[:title], url: params[:url])
    flash[:notice] = "That's not a valid url" unless valid_url

    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :edit
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
