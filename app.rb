require 'sinatra'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './lib/bookmark'
require './lib/comment'
require './lib/tag'
require './lib/bookmark_tag'
require './lib/user'

class BookmarkManager < Sinatra::Base
  configure do
    enable :sessions
    set    :session_secret, ENV['SESSION_SECRET']

    register Sinatra::Flash
  end

  get '/' do
    erb :index
  end

  get '/new' do
    erb :'new'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    bookmark = Bookmark.create(title: params[:title], url: params[:url])
    flash[:notice] = "That's not a valid url" unless bookmark

    if params[:tag] && bookmark
      tag = Tag.create(content: params[:tag])
      BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark.id)
    end

    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    @tags = Tag.all
    erb :'bookmarks/index'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @id = params[:id]
    erb :'bookmarks/comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/tags/new' do
    @id = params[:id]
    erb :'bookmarks/tags/new'
  end

  post '/bookmarks/:id/tags' do
    tag = Tag.create(content: params[:tag])
    BookmarkTag.create(tag_id: tag.id, bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/tags/:id' do
    @bookmarks = Bookmark.where(tag_id: params[:id])
    erb :'bookmarks/tags/show'
  end

  run! if app_file == $PROGRAM_NAME
end
