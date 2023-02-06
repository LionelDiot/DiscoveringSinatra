class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true

      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux créer un gossip"
      puts "2. Afficher les potins"
      puts "3. Supprime un potin par message"
      puts "4. Supprimer les potins d'un auteur"
      puts "5. Je veux quitter l'app"
      params = gets.chomp.to_i

      case params
      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip

      when 2
        puts "Tu as choisi de lire tous les gossips !"
        @controller.index_gossips

      when 3
        puts "Tu as choisi de supprimer un gossip quelqu'en  soit les auteurs"
        @controller.delete_gossip_by_message

      when 4
        puts "Tu as choisi de supprimer un auteur et tous ses gossips"
        @controller.delete_gossip_by_name

      when 5
        puts "À bientôt !"
        break

      else
        puts "Ce choix n'existe pas, merci de ressayer"

      end
    end
  end
end
