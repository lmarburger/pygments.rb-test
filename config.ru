require 'pygments.rb'
require 'rack'
STDOUT.sync = true

run(lambda {|env|
  code = Pygments.highlight "puts 'Hello, World!'", lexer:   'ruby',
                                                    options: { linenos: true }
  [200, {}, [code]]
})
