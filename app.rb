require 'rubygems'
require 'sinatra/base'
require 'sinatra/reloader'
require 'slim'

class SinatraBootstrap < Sinatra::Base
  get '/*' do
    begin
      slim params['splat'].join('').to_sym
    rescue StandardError => e
      e.to_s
    end
  end

  Dir['views/*.slim'].each do |tpl|
    name = File.basename(tpl, '.slim')
    send('get', name.to_sym) do
    end
  end

  run! if app_file == $PROGRAM_NAME
end
