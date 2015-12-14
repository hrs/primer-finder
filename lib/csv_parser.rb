class CsvParser
  def initialize(tempfile)
    @tempfile = tempfile
  end

  def primers
    CSV.foreach(tempfile, headers: true).
      select { |row| parsable_row?(row) }.
      map { |row| Primer.new(name: row[0], sequence: row[1], note: row[2]) }
  end

  private

  attr_reader :tempfile

  def parsable_row?(row)
    row[0] =~ /\w+/ &&
      row[1] =~ /^[AaCcGgTt\s]+$/ &&
      row[2] =~ /\w+/
  end
end
