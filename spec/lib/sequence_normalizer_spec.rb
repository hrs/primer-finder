require "spec_helper"

describe SequenceNormalizer do
  describe "#normalize" do
    it "lowercases the sequence" do
      expect(SequenceNormalizer.new("AcGt").normalize).to eq("acgt")
    end

    it "removes whitespace" do
      expect(SequenceNormalizer.new("\ta   cg\nt").normalize).to eq("acgt")
    end
  end
end
