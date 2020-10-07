class InterActive
    def initialize(attributes = {})
        attributes.each do |key, value|
            self.send("#{key}=", value)
        end
    end

    def save
        sql = <<-SQL
            INSERT INTO #{table_name_for_insert} (#{column_names_for_insert}) VALUES (#{values_for_insert})
        SQL
        DB[:conn].execute(sql)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
    end

    def table_name
        "#{self.to_s.downcase}s"
    end

    def table_name_for_insert
        self.class.table_name
    end
end