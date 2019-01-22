require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT * 
      FROM 
        plays
      WHERE 
        title = ?
    SQL
    return nil unless data.length > 0
    data.first 
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, playwright)
      SELECT 
      * 
      FROM 
        plays
      WHERE 
        playwright_id = ?
    SQL
    return nil unless data.length > 0
    data.first 
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map {|data| Play.new(data)}
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT 
      * 
      FROM 
        playwrights
      WHERE 
        name = ?
    SQL
    return nil unless data.length > 0
    data.first 
  end

  def initialize(options)
    @id = options["id"]
    @name = options["name"]
    @birth_date = options["birth_year"]
  end 

  require "byebug"

  def create
    # debugger
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays (playwright)
    data = PlayDBConnection.instance.execute(<<-SQL, playwright)
      SELECT * 
      FROM 
        playwrights
      JOIN
        plays ON
        playwrights.id = plays.playwright_id
      WHERE 
        name = ?
    SQL
    return nil unless data.length > 0
    data
  end 
end

y = Playwright.new({"name" => "stephen", "birth_year"=>1982})
y.create
p Playwright.all
# p x.get_plays("john")
# x.update
