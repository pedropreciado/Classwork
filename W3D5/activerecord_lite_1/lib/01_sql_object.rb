require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    table = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    @columns = table[0].map {|name| name.to_sym}

    # table[0].each do |col_name| # col_name = [0][0..-1]
    #   col = []
    #   table[1..-1].each do |hash|
    #     col << hash[col_name]
    #   end
    #   arr_table << col
    # end
    #
    # arr_table
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method("#{col_name}") do
        self.attributes[col_name]

      end

      define_method("#{col_name}=") do |value|
        self.attributes[col_name] = value

      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    "#{self}s".downcase
  end

  def self.all
    # ...
    table = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    self.parse_all(table[1..-1])
  end

  def self.parse_all(results) # returns array of self objects
    # ...
    results.map do |row|
      self.new(row)
    end
      # attrs = {}
      # hash.each do |k, v|
      #   attrs[k] = v
      # end
  end

  def self.find(id)
    # ...
    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    # p result
    self.parse_all(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |k, v|
      col_name = k.to_sym
      unless self.class.columns.include?(col_name)
        raise "unknown attribute \'#{col_name}\'"
      end
      self.send("#{col_name}=", v)
    end

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    attrs = []
    @attributes.each do |_ , v|
      attrs << v
    end
    attrs
  end

  def insert
    # ...
    col_num = self.class.columns.length
    cols = self.class.columns.join(", ")
    question_marks = ["?"] * col_num
    DBConnection.execute(<<-SQL, #{cols}
      INSERT INTO
        #{table_name}
      SELECT
        *
      FROM


    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
