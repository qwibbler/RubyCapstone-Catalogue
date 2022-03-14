require './app'

def main
  app = App.new
  puts [
    '',
    'A Catalogue of My Favorite Things',
    ''
  ]
  app.load
end

main
