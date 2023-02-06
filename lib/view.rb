# rubocop:disable Style/RedundantReturn

class View
  def create_gossip
    puts "Donne moi ton nom, oiseau de mauvaise augure !"
    print ">"
    author = gets.chomp
    puts "Allez raconte moi tout ;) "
    print ">"
    content = gets.chomp
    return params = { "author" => author, "content" => content } # rubocop:disable Lint/UselessAssignment
  end

  def delete_gossip_by_name
    puts "Donne moi le nom de la personne dont tu souhaites supprimer les potins !"
    print ">"
    return gets.chomp
  end

  def delete_gossip_by_message
    puts "Donne moi le potin que tu souhaiterais supprimer, s'il existe !"
    print ">"
    return gets.chomp
  end

  def index_gossips(gossip_array)
    puts
    gossip_array.each { |gossip|
      puts "#{gossip.author} a dit : #{gossip.content}"
    }
    puts
  end
end

# rubocop:enable Style/RedundantReturn
