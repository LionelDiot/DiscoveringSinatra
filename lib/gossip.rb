class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossip = []
    CSV.read("./db/gossip.csv").each do |row|
      all_gossip << Gossip.new(row[0], row[1])
    end
    return all_gossip
  end
  
  def self.find(id)
    i = 1
    temp_gossip = Gossip.new("pas d'auteur", "ni de gossip")
    CSV.read("./db/gossip.csv").each do |row|
      temp_gossip = Gossip.new(row[0], row[1]) if id.to_i == i
      i += 1
    end
    return temp_gossip
  end

  def self.update(id, new_author, new_content)
    gossips = []
    File.foreach("./db/gossip.csv") do |line|
      author, content = line.strip.split(",")
      gossips << [author, content]
    end

    gossips[id.to_i - 1][0] = new_author
    gossips[id.to_i - 1][1] = new_content

    File.open("./db/gossip.csv", "w") do |csv|
      gossips.each do |gossip|
        csv << "#{gossip[0]},#{gossip[1]}\n"
      end
    end
  end
end
