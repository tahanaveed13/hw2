# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!


Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all


warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros["id"]
dark_knight_rises.save



actors = {}

actor_names = ["Christian Bale", "Michael Caine", "Liam Neeson", "Katie Holmes", "Gary Oldman",
               "Heath Ledger", "Aaron Eckhart", "Maggie Gyllenhaal", "Tom Hardy", 
               "Joseph Gordon-Levitt", "Anne Hathaway"]

for name in actor_names
  actor = Actor.new
  actor["name"] = name
  actor.save
  actors[name] = actor # Store actor in a hash for easy lookup
end



Role.create(movie_id: batman_begins["id"], actor_id: actors["Christian Bale"]["id"], character_name: "Bruce Wayne")
Role.create(movie_id: batman_begins["id"], actor_id: actors["Michael Caine"]["id"], character_name: "Alfred")
Role.create(movie_id: batman_begins["id"], actor_id: actors["Liam Neeson"]["id"], character_name: "Ra's Al Ghul")
Role.create(movie_id: batman_begins["id"], actor_id: actors["Katie Holmes"]["id"], character_name: "Rachel Dawes")
Role.create(movie_id: batman_begins["id"], actor_id: actors["Gary Oldman"]["id"], character_name: "Commissioner Gordon")


Role.create(movie_id: dark_knight["id"], actor_id: actors["Christian Bale"]["id"], character_name: "Bruce Wayne")
Role.create(movie_id: dark_knight["id"], actor_id: actors["Heath Ledger"]["id"], character_name: "Joker")
Role.create(movie_id: dark_knight["id"], actor_id: actors["Aaron Eckhart"]["id"], character_name: "Harvey Dent")
Role.create(movie_id: dark_knight["id"], actor_id: actors["Michael Caine"]["id"], character_name: "Alfred")
Role.create(movie_id: dark_knight["id"], actor_id: actors["Maggie Gyllenhaal"]["id"], character_name: "Rachel Dawes")


Role.create(movie_id: dark_knight_rises["id"], actor_id: actors["Christian Bale"]["id"], character_name: "Bruce Wayne")
Role.create(movie_id: dark_knight_rises["id"], actor_id: actors["Gary Oldman"]["id"], character_name: "Commissioner Gordon")
Role.create(movie_id: dark_knight_rises["id"], actor_id: actors["Tom Hardy"]["id"], character_name: "Bane")
Role.create(movie_id: dark_knight_rises["id"], actor_id: actors["Joseph Gordon-Levitt"]["id"], character_name: "John Blake")
Role.create(movie_id: dark_knight_rises["id"], actor_id: actors["Anne Hathaway"]["id"], character_name: "Selina Kyle")

# Print movies
puts "Movies"
puts "======"
puts ""

movies = Movie.all
for movie in movies
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  puts "#{movie["title"].ljust(20)} #{movie["year_released"]} #{movie["rated"].ljust(5)} #{studio["name"]}"
end


# Print cast list
puts ""
puts "Top Cast"
puts "========"
puts ""

roles = Role.all
for role in roles
  movie = Movie.find_by({ "id" => role["movie_id"] })
  actor = Actor.find_by({ "id" => role["actor_id"] })
  puts "#{movie["title"].ljust(20)} #{actor["name"].ljust(20)} #{role["character_name"]}"
end
