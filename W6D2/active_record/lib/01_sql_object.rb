require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      @table ||= DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL

   @table.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method("#{column}") do
        @attributes[column]
      end
      define_method("#{column}=") do |value = nil|
        @attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name ||= self.name.to_s.tableize
  end

  def self.all
    @results = DBConnection.execute(<<-SQL)
    SELECT
      #{self.table_name}.*
    FROM 
      #{self.table_name}
  SQL
    parse_all(@results)
  end

  def self.parse_all(results)
    instance = []
    results.each do |result|
      instance << self.new(result)
    end
    instance
  end

  def self.find(id)
    self.all[id-1]
  end

  def initialize(params = {})
    params.each do |k, v|
      k = k.to_sym
      if !self.class.columns.include?(k)
        raise "unknown attribute '#{k}'"
      else   
        self.send("#{k}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
   self.class.columns.map {|col| self.send(col)}
  end

  def insert
    col_names = self.class.columns.join(",")
    question_marks = []
    col_names.length times {question_marks << "?"}
    question_marks.join!(",")
    # DBConnection.execute(<<-SQL,)
  end

  def update
    # ...
  end

  def save
    # ...
  end
end


class Cat < SQLObject
  finalize!
end