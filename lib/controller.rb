require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "Ceci est le contenu du hash params : #{params}"
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show, locals: { current_gossip: Gossip.find(params['id']), id: params['id'] }
  end

  get '/gossips/:id/edit/' do
    erb :edit, locals: { current_gossip: Gossip.find(params['id']), id: params['id'] }
  end

  post '/gossips/:id/edit/' do
    Gossip.update(params["id"], params["gossip_author"], params["gossip_content"])
    redirect '/'
  end
end

# class Controller
#   def initialize
#     @view = View.new
#   end
#
#   def create_gossip
#     params = @view.create_gossip
#     gossip = Gossip.new(params["author"], params["content"])
#     gossip.save
#   end
#
#   def index_gossips
#     @view.index_gossips(Gossip.all)
#   end
#
#   def delete_gossip_by_name
#     params = @view.delete_gossip_by_name
#     Gossip.delete_gossip_by_name(params)
#   end
#
#   def delete_gossip_by_message
#     params = @view.delete_gossip_by_message
#     Gossip.delete_gossip_by_message(params)
#   end
# end
