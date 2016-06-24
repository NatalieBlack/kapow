# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
names = [
          "Edward Sotomayor Jr.",
          "Stanley Almodovar III",
          "Luis Omar Ocasio-Capo",
          "Juan Ramon Guerrero",
          "Luis S. Vielma",
          "Eric Ivan Ortiz-Rivera",
          "Peter O. Gonzalez-Cruz",
          "Kimberly Morris",
          "Eddie Jamoldroy Justice",
          "Darryl Roman Burt II",
          "Deonka Deidra Drayton",
          "Alejandro Barrios Martinez",
          "Anthony Luis Laureano Disla",
          "Jean Carlos Mendez Perez",
          "Franky Jimmy Dejesus Velazquez",
          "Amanda Alvear",
          "Martin Benitez Torres",
          "Luis Daniel Wilson-Leon",
          "Mercedez Marisol Flores",
          "Xavier Emmanuel Serrano Rosado",
          "Enrique Rios",
          "Gilberto Ramon Silva Menendez",
          "Simon Adrian Carrillo Fernandez",
          "Oscar A Aracena-Montero",
          "Miguel Angel Honorato",
          "Javier Jorge-Reyes",
          "Jonathan A. Camuy Vega",
          "Joel rayon Paniagua",
          "Jason Benjamin Josaphat",
          "Cory James Connell",
          "Juan P. Rivera Velazquez",
          "Luis Daniel Conde",
          "Shane Evan Tomlinson",
          "Juan Chevez-Martinez",
          "Jerald Arthur Wright",
          "Leroy Valentin Fernandez",
          "Tevin Eugene Crosby",
          "Jean C. Nieves Rodriguez",
          "Rodolfo Ayala-Ayala",
          "Brenda Lee Marquez McCool",
          "Yilmary Rodriguez Solivan",
          "Christoper Andrew Leinonen",
          "Angel L. Candelario-Padro",
          "Frank Hernandez",
          "Paul Terrell Henry",
          "Antonio Davon Brown",
          "Christopher Joseph Sanfeliz",
          "Akyra Monet Murray",
          "Geraldo A. Ortiz-Jimenez",
]
names.each do |name|
  Entry.create!(name: name)
end
