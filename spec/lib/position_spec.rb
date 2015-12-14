require "spec_helper"

describe Position do
  describe "#overlap_with" do
    it "handles a bunch of cases" do
      pos = Position.new(start_pos: 2, end_pos: 7)

      expect(pos.overlap_with(Position.new(start_pos: 0, end_pos: 1))).to eq (0)
      expect(pos.overlap_with(Position.new(start_pos: 0, end_pos: 2))).to eq (0)
      expect(pos.overlap_with(Position.new(start_pos: 0, end_pos: 4))).to eq (2)
      expect(pos.overlap_with(Position.new(start_pos: 0, end_pos: 9))).to eq (5)
      expect(pos.overlap_with(Position.new(start_pos: 3, end_pos: 5))).to eq (2)
      expect(pos.overlap_with(Position.new(start_pos: 5, end_pos: 7))).to eq (2)
      expect(pos.overlap_with(Position.new(start_pos: 5, end_pos: 8))).to eq (2)
      expect(pos.overlap_with(Position.new(start_pos: 7, end_pos: 9))).to eq (0)
      expect(pos.overlap_with(Position.new(start_pos: 8, end_pos: 9))).to eq (0)
    end
  end
end
