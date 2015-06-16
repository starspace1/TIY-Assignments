require 'active_record'
require './post'

for i in 1..100 do
 
  # = lorem_ipsum '10c' # Ten characters
  # = lorem_ipsum '5w'  # Five words
  # = lorem_ipsum '2s'  # Two sentences
  # = lorem_ipsum '3p'  # Three paragraphs

  Post.create(title: lorem_ipsum '2w', author: lorem_ipsum '1w', text: lorem_ipsum '1p')

end

puts Post.size