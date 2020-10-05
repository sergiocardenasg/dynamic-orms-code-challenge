class Listing
    # Listing belongs to Agent
    attr_reader :location, :id
    attr_accessor :status, :price, :agent
    
    def initialize(location, price, status="for sale")
        @location = location
        @price = price
        @status = status
    end
    
    def price_drop(percentage)
        self.price -= self.price*percentage
    end
    
    def self.all
        sql = <<-SQL
        SELECT * 
        FROM listings
        SQL
        
        DB[:conn].execute(sql).map do |row|
            listing = Listing.new(row[1], row[2], row[3])
            listing.id = row[0]
            listing
        end
    end

    def self.create_table
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS listings (
            id INTEGER PRIMARY KEY,
            location TEXT,
            price REAL,
            status TEXT DEFAULT 'for sale',
            agent_id INTEGER
        )
        SQL

        DB[:conn].execute(sql)
    end

    def save
        sql = <<-SQL
        INSERT INTO listings (location, price, status, agent_id)
        VALUES (?,?,?,?)
        SQL
  
        DB[:conn].execute(sql, self.location, self.price, self.status, self.agent_id)
  
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM listings")[0][0]
      end

end