# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cattoys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/query_tuning_setup.rb'

# Run the specs and make sure to make the query plans for the following 
# questions as efficient as possible.

# Experiment with adding and dropping indexes, and using subqueries vs. other 
# methods to see which are more efficient.

def example_find_jet
# Find the breed and color for the cat named 'Jet'.

# Get cost within the range of: 4..15

#  CREATE INDEX cats_name ON cats(name)

execute(<<-SQL)
  SELECT
    cats.name
  FROM
    cats
  WHERE 
    cats.name = 'Jet'
  SQL
end


def cats_and_toys_alike
  # Find all the cat names where the cat and the toy they own are both the color 'Blue'.

  # Order alphabetically by cat name
  # Get your overall cost lower than: 590
  execute(<<-SQL)
    DROP INDEX idx_color;
    CREATE INDEX idx_color
    ON cats(color);
    SELECT 
      distinct cats.name
    FROM
      cats
    JOIN
      cattoys ON cats.id = cattoys.cat_id
    JOIN
      toys ON cattoys.toy_id = toys.id
    WHERE
      cats.color = 'Blue' AND toys.color = 'Blue'
    ORDER BY
      cats.name;
  SQL
end

def toyless_blue_cats
  # Use a type of JOIN that will list the names of all the cats that are 'Navy Blue' and have no toys. 

  # Get your overall cost lower than: 95
  execute(<<-SQL)
    SELECT
      cats.name
    FROM
      cats
    LEFT JOIN
      cattoys ON cats.id = cattoys.cat_id
    LEFT JOIN
      toys ON cattoys.toy_id = toys.id
    WHERE
      cats.color = 'Navy Blue'
    GROUP BY
      cats.name
    HAVING
      count(toys.name) = 0 
  SQL
end

def find_unknown
  # Find all the toys names that belong to the cat who's breed is 'Unknown'.

  # Order alphabetically by toy name

  # Get your overall cost lower than: 406
  execute(<<-SQL)
    DROP INDEX idx_breed;
    CREATE INDEX idx_breed
    ON cats(breed);
    SELECT
      toys.name
    FROM
      cats
    LEFT JOIN
      cattoys ON cats.id = cattoys.cat_id
    LEFT JOIN
      toys ON cattoys.toy_id = toys.id
    WHERE
      cats.breed = 'Unknown'
    ORDER BY
      toys.name
  SQL
end

def cats_like_johnson
  # Find the breed of the 'Lavender' colored cat named 'Johnson'. 
  # Then find all the name of the other cats that belong to that breed. 
  # Include the original Lavendar colored cat name Johnson in your results.

  # Order alphabetically by cat name

  # Get your overall cost lower than: 100
  execute(<<-SQL)
    DROP INDEX idx_name;
    CREATE INDEX idx_name
    ON cats(name);
    SELECT
      cats2.name
    FROM
      cats as cats1
    JOIN  
      cats as cats2
    ON cats1.breed = cats2.breed
    WHERE
      cats1.color = 'Lavender' and cats1.name = 'Johnson'
    ORDER BY
      cats2.name
  SQL
end


def cheap_toys_and_their_cats
  # Find the cheapest toy. Then list the name of all the cats that own that toy.

  # Order alphabetically by cats name
  # Get your overall cost lower than: 230
  execute(<<-SQL)
     SELECT 
      cats.name
    FROM
      cats
    JOIN
      cattoys ON cats.id = cattoys.cat_id
    JOIN
      toys ON cattoys.toy_id = toys.id
    WHERE
      toys.id =(
        SELECT
          toys.id
        FROM
          toys
        ORDER BY
          toys.price
        LIMIT 1
      )
    ORDER BY 
      cats.name
    
  SQL
end
# SELECT
#       cats.name
#     FROM
#       cats AS cats1
#     JOIN
#       cattoys ON cats1.id = cattoys.cat_id
#     JOIN
#       toys AS toys ON cattoys.toy_id = toys.id
#     JOIN
#       cattoys AS ct2 ON toys.id = ct2.toy_id
#     JOIN
#       cats as cats2 ON ct2.cat_id = cats2.id
#     WHERE

def cats_with_a_lot
  # Find the names of all cats with more than 7 toys.
  
  # Order alphabetically by cat name
  # Get your overall cost lower than: 1200
  execute(<<-SQL)
    SELECT
      cats.name
    FROM
      cats
    JOIN
      cattoys ON cats.id = cattoys.cat_id
    JOIN
      toys ON cattoys.toy_id = toys.id
    GROUP BY
      cats.id
    HAVING
      count(distinct toys.id) > 7
    ORDER BY
      cats.name
  SQL
end


def expensive_tastes
  # Find the most expensive toy then list the toys's name, toy's color, and the name of each cat that owns that toy.
  # Order alphabetically by cat name
  # Get your overall cost lower than: 720
  execute(<<-SQL)
    SELECT
      cats.name, toys.name, toys.color
    FROM
      cats
    JOIN
      cattoys ON cats.id = cattoys.cat_id
    JOIN
      toys ON cattoys.toy_id = toys.id
    WHERE
      toys.id = (
        SELECT
          toys.id
        FROM
          toys
        ORDER BY
          toys.price desc
        LIMIT 1)
    ORDER BY
        cats.name
  SQL
end


def five_cheap_toys
  # Find the name and prices for the five cheapest toys.

  # Order alphabetically by toy name.
  # Get your overall cost lower than: 425
  execute(<<-SQL)
    SELECT 
      ran.name, ran.price
    FROM
    (
    SELECT
      toys.name, toys.price
    FROM
      toys
    ORDER BY
      toys.price 
    LIMIT 5) as ran
    ORDER BY
      ran.name

  SQL
end

def top_cat
  # Finds the name of the single cat who has the most toys and the number of toys.

  # Get your overall cost lower than: 1050
  execute(<<-SQL)
    explain SELECT
      cats.name, count(toys.id)
    FROM
      cats
    JOIN
      cattoys ON cats.id = cattoys.cat_id
    JOIN
      toys ON cattoys.toy_id = toys.id
    GROUP BY
      cats.id
    ORDER BY
      count(toys.id) desc
    LIMIT 1
  SQL
end


