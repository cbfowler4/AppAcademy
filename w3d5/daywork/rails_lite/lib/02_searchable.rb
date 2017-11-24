require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    names = ""
    params.each do |cur_attr, val|
      names += "#{self.table_name}.#{cur_attr} = ? AND "
    end  
    
    names = names[0..-6]
    
    results = DBConnection.execute(<<-SQL, params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{names}
    SQL
    
    return [] if results.empty?
    results.map do |result|
      self.new(result)
    end 
  end
  

end

class SQLObject
  extend Searchable
end
