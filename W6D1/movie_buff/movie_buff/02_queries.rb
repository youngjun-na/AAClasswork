def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.

  Movie
    .select(:id,:title,:yr,:score)
    .where(yr: 1980..1989)
    .where(score: 3..5)
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  # yr (rating > 8) == yrs (no movies released with score above 8)
  # Q(   NOT IN sq(yr of movies that score above 8))
  included = Movie.select(:yr).where("movies.score > 8")

  Movie
    .where("yr NOT IN (?)", included)
    .pluck(:yr).uniq
    
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .select(:id, :name)
    .joins(:movies)
    .where("movies.title = ?", title)
    .order("castings.ord ASC")
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie
    .select(:id, :title, "actors.name")
    .joins(:actors, :director)
    .where("actors.id = movies.director_id AND castings.ord = 1")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select(:id, :name, "COUNT(*) as roles")
    .joins(:movies)
    .where("castings.ord != 1")
    .group(:id)
    .order("COUNT(*) DESC")
    .limit(2)
end
