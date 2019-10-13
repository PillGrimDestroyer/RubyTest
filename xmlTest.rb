require 'rexml/document'
include REXML

# open and write to a file with ruby
open('movies.xml', 'w') { |f|
  f.puts "
  <collection shelf = \"New Arrivals\">
   <movie title = \"Enemy Behind\">
      <type>War, Thriller</type>
      <format>DVD</format>
      <year>2003</year>
      <rating>PG</rating>
      <stars>10</stars>
      <description>Talk about a US-Japan war</description>
   </movie>
   <movie title = \"Transformers\">
      <type>Anime, Science Fiction</type>
      <format>DVD</format>
      <year>1989</year>
      <rating>R</rating>
      <stars>8</stars>
      <description>A schientific fiction</description>
   </movie>
   <movie title = \"Trigun\">
      <type>Anime, Action</type>
      <format>DVD</format>
      <episodes>4</episodes>
      <rating>PG</rating>
      <stars>10</stars>
      <description>Vash the Stampede!</description>
   </movie>
   <movie title = \"Ishtar\">
      <type>Comedy</type>
      <format>VHS</format>
      <rating>PG</rating>
      <stars>2</stars>
      <description>Viewable boredom</description>
   </movie>
</collection>
  "
}

xmlfile = File.new("movies.xml")
xmldoc = Document.new(xmlfile)

# Now get the root element
root = xmldoc.root
puts "Root element : " + root.attributes["shelf"]

# This will output all the movie titles.
xmldoc.elements.each("collection/movie"){ 
   |e| puts "Movie Title : " + e.attributes["title"] 
}

# This will output all the movie types.
xmldoc.elements.each("collection/movie/type") {
   |e| puts "Movie Type : " + e.text 
}

# This will output all the movie description.
xmldoc.elements.each("collection/movie/description") {
   |e| puts "Movie Description : " + e.text 
}