class SearchResult
  attr_reader :primer, :binding_length, :primer_end

  def initialize(primer:, binding_length:, primer_end:)
    @primer = primer
    @binding_length = binding_length
    @primer_end = primer_end
  end

  def successful?
    binding_length > 0
  end

  def ==(other)
    self.class == other.class &&
      primer == other.primer &&
      binding_length == other.binding_length
  end

  def to_partial_path
    "search_results/search_result"
  end
end
