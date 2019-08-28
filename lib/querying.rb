def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, year FROM books JOIN series ON books.series_id = books.series_id WHERE books.series_id = (SELECT books.series_id FROM books ORDER BY year LIMIT 1) GROUP BY books.title ORDER BY year;" #GROUP BY series.id ORDER BY year
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species) AS greatest_number FROM characters GROUP BY species ORDER BY greatest_number DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM subgenres JOIN series ON subgenres.id = series.subgenre_id JOIN authors ON series.author_id = authors.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM characters JOIN character_books ON characters.id = character_books.character_id JOIN books ON character_books.book_id = books.id JOIN series ON books.series_id = series.id GROUP BY series.title, characters.species ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) FROM characters JOIN character_books ON characters.id = character_books.character_id JOIN books ON character_books.book_id = books.id GROUP BY characters.name ORDER BY COUNT(character_books.book_id) DESC;"
end
