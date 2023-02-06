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
