require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/all') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:new_word)
end

get ('/words/search') do
  search_term = params[:search]
  @words = Word.search(search_term)
  erb(:words)
end

get ('/words/:id') do
  @album = Word.find(params[:id].to_i())
  erb(:word)
end

get ('/search') do
  erb(:search)
end

post ('/words') do
  name = params[:word_name]
  @word = Word.new(name, nil)
  @word.save()
  @words = Word.all
  erb(:words)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get ('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end


# *********SONGS ROUTING********* #


# Get the detail for a specific song such as lyrics and songwriters.
get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

# Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end

# Edit a song and then route back to the album view.
patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  song.update(params[:name], @word.id)
  erb(:word)
end

# Delete a song and then route back to the album view.
delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  Definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
