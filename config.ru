require 'rubygems'
require 'bundler/setup'

require 'sinatra/base'
require 'pygments'

class Viso < Sinatra::Base

  get '/' do
    [ 200, {}, code ]
  end

  def code
    file     = File.open __FILE__
    filename = File.basename file.path
    code     = file.read

    Pygments.highlight code, :lexer => 'ruby', :options => { :full => true }
  end

end


run Viso
