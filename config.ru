require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'pygments'

class Viso < Sinatra::Base

  set :public, 'public'

  get '/' do
    erb :show
  end

  def code
    file = File.open __FILE__

    Pygments.highlight file.read, :lexer => 'ruby'
  end

end


run Viso
