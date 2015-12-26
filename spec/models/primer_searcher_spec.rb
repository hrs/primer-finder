require "spec_helper"

describe PrimerSearcher do
  describe "#initialize" do
    it "downcases and removes whitespace from sequnces" do
      primer_searcher = PrimerSearcher.new(
        primers: [],
        target: "Aaa   CC C",
        target_container: "G g aa   ACccT"
      )

      expect(primer_searcher.target).to eq "aaaccc"
      expect(primer_searcher.target_container).to eq "ggaaaccct"
    end
  end

  describe "#target_position" do
    it "returns the position of the target in the target container" do
      primer_searcher = PrimerSearcher.new(
        primers: [],
        target: "aaaccc",
        target_container: "ggaaaccct"
      )

      expect(primer_searcher.target_position).
        to eq(Position.new(start_pos: 2, end_pos: 8))
    end

    it "raises an error if the target can't be found" do
      primer_searcher = PrimerSearcher.new(
        primers: [],
        target: "aaaccc",
        target_container: "ggatttccct"
      )

      expect { primer_searcher.target_position }.
        to raise_error PrimerSearchError
    end
  end

  describe "#results" do
    it "returns the matches that succeeded" do
      binding_primer = Primer.new(name: "winner", sequence: "aacc")
      primer_searcher = PrimerSearcher.new(
        target_container: "aaaaaaaacccgggggggg",
        target: "ccc",
        primers: [
          binding_primer,
          Primer.new(name: "loser", sequence: "tttt"),
        ],
      )
      expected_match = SearchResult.new(
        primer: binding_primer,
        binding_length: 2,
        primer_end: :tail,
      )

      expect(primer_searcher.results).to eq([expected_match])
    end
  end
end
