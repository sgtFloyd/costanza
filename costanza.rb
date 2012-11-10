require 'sinatra'

def gifs
  Dir[File.join('public', 'img', '*.gif')]
    .select{|f| !f.match(/progress\.gif/)}
end

get '/' do
  send_file File.join('public', 'index.html')
end

get '/.gif' do
  send_file gifs.sample
end
