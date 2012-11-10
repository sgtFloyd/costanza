require 'sinatra'

set :public_folder, 'public'

get '/' do
  haml :index
end

get '/.gif' do
  send_file gifs.sample
end

def gifs
  Dir[File.join('public', 'img', '*.gif')]
    .select{|f| !f.match(/progress\.gif/)}
end
