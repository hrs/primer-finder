class Primer
  attr_reader :name, :sequence

  def initialize(name:, sequence:)
    @name = name
    @sequence = sequence.downcase
  end

  def binds_to?(target)
    binds_to_front_of?(target) || binds_to_back_of?(target)
  end

  def reverse_complement
    Primer.new(
      name: name + "--reverse",
      sequence: sequence_reverse_compliment,
    )
  end

  def in_container?(target_container)
    target_container.include?(sequence)
  end

  private

  REVERSE_COMPLIMENT_BASES = {
    "a" => "t",
    "c" => "g",
    "t" => "a",
    "g" => "c",
  }

  def sequence_reverse_compliment
    sequence.
      reverse.
      each_char.
      map { |char| REVERSE_COMPLIMENT_BASES[char] }.
      join
  end

  def binds_to_front_of?(target)
    target.start_with?(*sequence_tails)
  end

  def binds_to_back_of?(target)
    target.end_with?(*sequence_heads)
  end

  def sequence_heads
    sequence.size.times.map { |i| sequence[0..i] }.reverse
  end

  def sequence_tails
    sequence.size.times.map { |i| sequence[i..-1] }
  end
end
