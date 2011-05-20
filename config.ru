# https://github.com/lmarburger/pygments.rb-test

require 'rubygems'
require 'pygments'
require 'sinatra/base'

class PygmentsTest < Sinatra::Base

  set :public, 'public'

  get '/' do
    erb :show
  end

  def code
    file = File.open __FILE__

    Pygments.highlight file.read, :lexer => 'ruby'
  end

end

run PygmentsTest
