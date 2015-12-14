class CsvParser
  def initialize(tempfile)
    @tempfile = tempfile
  end

  def primers
    CSV.foreach(tempfile, headers: true).
      select { |row| row[0] =~ /\w+/ }.
      map { |row| Primer.new(sequence: row[1], name: row[2]) }
  end

  private

  attr_reader :tempfile
end
