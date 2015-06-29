def make_acronym(phrase)
  return 'Not a string' if !phrase.is_a?(String)
  return '' if phrase == ''
  return 'Not letters' if phrase.gsub(/[^a-zA-Z ]/,'').strip == ""
  phrase.split(" ").map{|word| word[0].upcase}.join
end