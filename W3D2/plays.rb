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
    table = PlayDBConnection.instance.execute("SELECT * FROM plays")
    table.map { |row| p Play.new(row) }
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

  def find_by_title(title)
    plays = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    p plays
  end 

  def find_by_playwright(name)
    playwright_id = Playwright.find_by_name(name)
    plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    p plays
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    table = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    table.map { |row| p Playwright.new(row) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO 
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def find_by_name(name)
    plays = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    plays['id']
  end 
end

# puts "play"
# Play.all
# x = Play.new({'title'=> "this is title", 'year'=> 1995 ,'playwright_id'=>5})
y = Playwright.new({'name'=> "Calculon", 'birth_year'=> 1111})
puts "playwright"
Playwright.all
y.create
y.birth_year = 1010
y.update
puts "playwright"
Playwright.all
# x.create
# puts
# Play.all
# x.find_by_title("this is title")
# x.find_by_playwright('Arthur Miller')