class SearchResult
  attr_reader :primer, :binding_length

  def initialize(primer:, binding_length:)
    @primer = primer
    @binding_length = binding_length
  end

  def successful?
    binding_length > 0
  end

  def ==(other)
    self.class == other.class &&
      primer == other.primer &&
      binding_length == other.binding_length
  end
end
