require 'sinatra'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure do
    enable :sessions
    set    :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    erb :index
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
