require "yaml"

score_pairs = []

File.open("leaderboard.save", "w") do |f|
  f.puts score_pairs.to_yaml
end 

