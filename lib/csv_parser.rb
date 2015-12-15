class CsvParser
  def initialize(tempfile)
    @tempfile = tempfile
  end

  def primers
    CSV.foreach(tempfile, headers: true).
      select { |row| parsable_row?(row) }.
      map { |row| primer_from_row(row) }
  end

  private

  attr_reader :tempfile

  def primer_from_row(row)
    Primer.new(
      name: row[0],
      sequence: row[1],
      note: row[2] || ""
    )
  end

  def parsable_row?(row)
    row[0] =~ /\w+/ &&
      row[1] =~ /^[AaCcGgTt\s]+$/
  end
end
