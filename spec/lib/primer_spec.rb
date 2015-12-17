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
