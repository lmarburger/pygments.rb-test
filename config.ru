# https://github.com/lmarburger/pygments.rb-test

require 'rubygems'
require 'sinatra/base'

require 'pygments'
Pygments.configure :python_exe => 'python2.6'

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
