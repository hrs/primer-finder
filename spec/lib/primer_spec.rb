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

    it "handles edge cases" do
      container = "ttaaaacccc"
      position = Position.new(start_pos: 0, end_pos: 6)
      primer = Primer.new(name: "", sequence: "aaaacccc")

      expect(primer.overlap(container: container, position: position)).to eq(4)
    end

    it "returns 0 if the primer won't bind" do
      container = "aaaaaaaacccgggggggg"
      position = Position.new(start_pos: 8, end_pos: 11)
      primer = Primer.new(name: "", sequence: "tttt")

      expect(primer.overlap(container: container, position: position)).to eq(0)
    end
  end

  describe "#reverse_complement" do
    it "returns the reverse complement of the primer" do
      primer = Primer.new(
        name: "primer",
        sequence: "aaagt",
        note: "Just some primer."
      )

      reverse_complement = Primer.new(
        name: "primer--reverse complement",
        sequence: "acttt",
        note: "Just some primer."
      )

      expect(primer.reverse_complement).to eq(reverse_complement)
    end
  end

  describe "#binding_end" do
    it "returns :head if the target overlaps with the front of the primer" do
      target = "cac"
      primer = Primer.new(name: "", sequence: "acgg")

      expect(primer.binding_end(target, 2)).to eq(:head)
    end

    it "returns :tail if the target overlaps with the back of the primer" do
      target = "cac"
      primer = Primer.new(name: "", sequence: "ggca")

      expect(primer.binding_end(target, 2)).to eq(:tail)
    end

    it "returns :contained if the primer's entirely within the target" do
      target = "cacttttg"
      primer = Primer.new(name: "", sequence: "acttt")

      expect(primer.binding_end(target, 5)).to eq(:contained)
    end
  end
end
