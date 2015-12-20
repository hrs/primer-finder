class SequenceNormalizer
  def initialize(sequence)
    @sequence = sequence
  end

  def normalize
    sequence.downcase.gsub(/\s+/, "")
  end

  private

  attr_reader :sequence
end
