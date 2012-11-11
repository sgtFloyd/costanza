require 'sinatra'

set :public_folder, 'public'

get '/' do
  haml :index
end

get '/.gif' do
  send_file random_gif
end

get '/:num.gif' do
  send_file direct_gif(params[:num])
end

def gifs
  Dir[File.join('public', 'img', '*.gif')]
    .select{|f| !f.match(/progress\.gif/)}
end

def random_gif
  gifs.sample
end

def direct_gif(num)
  gif_file = File.join('public', 'img', "#{num}.gif")
  File.exists?(gif_file) ? gif_file : random_gif
end
