def chaineAlea(num)
  text = ""
  num.times{|t| text << ('A'..'Z').to_a.sample}
  text
end

def rechercheDebut(base, num)
  starting_time = Time.now
  text=chaineAlea(num)
  while (!text.start_with?(base)) do
    text=chaineAlea(num)
  end
  ending_time = Time.now
  p "match found: #{text}"
  p "it took #{ending_time.to_f - starting_time.to_f} seconds"
end

rechercheDebut("AA", 8)