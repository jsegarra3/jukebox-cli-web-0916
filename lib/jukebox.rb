require "pry"

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def play(songs)
  puts "Please enter a song name or number:"
  entry = gets.chomp
  #binding.pry
  badEntry = true
  choice = ""
  songs.each_index do |i|
    if entry.to_i == (i+1)
      choice = "Playing #{songs[i]}"
      badEntry = false
    elsif entry.to_s == songs[i]
      choice = "Playing #{songs[i]}"
      badEntry = false
    end
  end
  #binding.pry
  if badEntry
    puts "Invalid input, please try again"
  else
    puts choice
  end
end


def list(songs)
  songs.each_index do |i|
    puts "#{i+1}. #{songs[i]}"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help()
  i=0
  while i == 0
    puts "Please enter a command:"
    command = gets.chomp
    if command == "help"
      help()
    elsif command == "exit"
      exit_jukebox()
      i=1
    elsif command == "list"
      list(songs)
    elsif command == "play"
      play(songs)
    end
  end
end
