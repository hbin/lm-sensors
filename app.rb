require 'sinatra'

class Application < Sinatra::Base
  get '/' do
    %x(sensors).split("\n").join("<br/>")
  end
end
