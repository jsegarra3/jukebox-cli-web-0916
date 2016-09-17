#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

 my_songs = {
 "Go Go GO" => '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '/Users/jsegarra3/.atom/code/labs/labs/jukebox-cli/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/04.mp3',
 "Wolf" => '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/05.mp3',
 "Blue" => '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '/Users/jsegarra3/.atom/code/labs/jukebox-cli/audio/Emerald-Park/07.mp3'
 }

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  i=1
  my_songs.each do |key,filePath|
    puts "#{i}. #{key}"
    i+=1
  end
end

def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash

    puts "Please enter a song name:"
    entry = gets.chomp
    badEntry = true
    choice = ""
    datPath = ""
    my_songs.each do |title,filePath|
      if entry == (title)
        choice = "Playing #{title}"
        datPath = filePath
        badEntry = false
      end
    end
    #binding.pry
    if badEntry
      puts "Invalid input, please try again"
    else
      puts choice
      system 'open #{datPath}'
    end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
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
      list(my_songs)
    elsif command == "play"
      play(my_songs)
    end
  end
end
