# https://github.com/lmarburger/pygments.rb-test

require 'pygments'
require 'rubygems'
require 'sinatra/base'

# Use python2.6 as 2.7 errors on some Heroku stacks.
require 'rubypython'
RubyPython.configure :python_exe => 'python2.6'

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
