require "spec_helper"

describe Primer do
  describe "#bindable_region" do
    it "gets the area around the position" do
      container = "aaaaaaaacccgggggggg"
      position = Position.new(start_pos: 8, end_pos: 11)
      primer = Primer.new(name: "", sequence: "tttt")

      expect(primer.bindable_region(container, position)).to eq("aaacccggg")
    end
  end

  describe "#overlap" do
    it "returns the number of overlapping base pairs, if any" do
      container = "aaaaaaaacccgggggggg"
      position = Position.new(start_pos: 8, end_pos: 11)
      primer = Primer.new(name: "", sequence: "aacc")

      expect(primer.overlap(container: container, position: position)).to eq(2)
    end

    it "returns 0 if the primer won't bind" do
      container = "aaaaaaaacccgggggggg"
      position = Position.new(start_pos: 8, end_pos: 11)
      primer = Primer.new(name: "", sequence: "tttt")

      expect(primer.overlap(container: container, position: position)).to eq(0)
    end
  end
end
