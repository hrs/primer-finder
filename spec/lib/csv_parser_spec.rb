require "spec_helper"

describe CsvParser do
  describe "#primers" do
    it "returns a list of primers from a CSV" do
      temp = temp_csv(
        ["Name", "Sequence", "Notes"],
        ["Foo", "ACGT", "something"],
        ["Bar", "TGCA", "something else"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to eq([
        Primer.new(name: "Foo", sequence: "ACGT", note: "something"),
        Primer.new(name: "Bar", sequence: "TGCA", note: "something else")
      ])
    end

    it "requires that the CSV have a name column" do
      temp = temp_csv(
        ["Sequence", "Notes"],
        ["ACGT", "something"],
        ["TGCA", "something else"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to be_empty
    end

    it "doesn't require that the CSV have a notes column" do
      temp = temp_csv(
        ["Name", "Sequence"],
        ["Foo", "ACGT"],
        ["Bar", "TGCA"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to eq([
        Primer.new(name: "Foo", sequence: "ACGT"),
        Primer.new(name: "Bar", sequence: "TGCA")
      ])
    end

    it "allows whitespace in sequences" do
      temp = temp_csv(
        ["Name", "Sequence"],
        ["Foo", "  ACGT"],
        ["Bar", "TG\tCA"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to eq([
        Primer.new(name: "Foo", sequence: "ACGT"),
        Primer.new(name: "Bar", sequence: "TGCA")
      ])
    end

    it "skips primers that aren't all A/C/G/T and whitespace" do
      temp = temp_csv(
        ["Name", "Sequence"],
        ["Foo", "AdddGT"],
        ["Bar", "TGCA"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to eq([
        Primer.new(name: "Bar", sequence: "TGCA")
      ])
    end

    it "skips empty rows" do
      temp = temp_csv(
        ["Name", "Sequence"],
        ["Foo", "ACGT"],
        ["", ""],
        ["Bar", "TGCA"]
      )

      parser = CsvParser.new(temp)
      expect(parser.primers).to eq([
        Primer.new(name: "Foo", sequence: "ACGT"),
        Primer.new(name: "Bar", sequence: "TGCA")
      ])
    end

    def temp_csv(*rows)
      Tempfile.new("csv").tap do |temp|
        rows.each { |row| temp.write(row.join(",") + "\n") }
        temp.rewind
      end
    end
  end
end
