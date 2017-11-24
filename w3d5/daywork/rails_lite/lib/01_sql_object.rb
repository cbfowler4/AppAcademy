require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @cols.nil?
      cols = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM 
          #{self.table_name}
      SQL
      
      @cols = cols[0].map do |col_name|
        col_name.to_sym
      end
    end
    @cols 
  end

  def self.finalize!
    
    self.columns.each do |col_name|
      define_method("#{col_name}=") do |arg|
        self.attributes[col_name] = arg
      end 
    
      define_method("#{col_name}") do 
        self.attributes[col_name]
      end
    end
  end

  def self.table_name=(table_name_var)
    @table_name = table_name_var
  end

  def self.table_name
    @table_name = self.to_s.tableize if @table_name.nil?
    @table_name
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
        #{table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |obj|
      self.new(obj)
    end
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{@table_name}
      WHERE
        id = ?
    SQL

    return nil if results.empty?
    self.new(results.first)
  end

  def initialize(params = {})
    table_cols = self.class.columns
    params.each do |col_name, value|
      raise "unknown attribute '#{col_name}'" unless table_cols.include?(col_name.to_sym)
      self.send("#{col_name}=", value)
    end 
  end

  def attributes
    @attributes ||= Hash.new
  end

  def attribute_values
    @attributes.values
  end

  def insert
    attrs = self.attributes
    questions = "("
    names = "("
    attrs.each do |cur_attr, val|
      questions += "?, "
      names += "#{cur_attr}, "
    end  
    
    questions = questions[0..-3] + ")"
    names = names[0..-3] + ")"
    
    DBConnection.execute(<<-SQL, self.attribute_values)
      INSERT INTO 
        #{self.class.table_name} #{names}
      VALUES 
        #{questions}
      SQL
      
      @attributes[:id] = DBConnection.last_insert_row_id
  end

  def update
    attrs = self.attributes
    names = ""
    attrs.each do |cur_attr, val|
      next if cur_attr == :id
      names += "#{cur_attr} = ?, "
    end  
    
    names = names[0..-3]
    
    input_attr = self.attribute_values[1..-1] << self.attribute_values[0]
    
    DBConnection.execute(<<-SQL, input_attr)
      UPDATE 
        #{self.class.table_name}
      SET
        #{names}
      WHERE 
        id = ?
      SQL
  end

  def save
    self.attributes.key?(:id) ? update : insert
  end
  
end
