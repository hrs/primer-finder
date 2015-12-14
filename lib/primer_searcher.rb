class PrimerSearcher
  def initialize(primers:, target:, target_container:)
    @primers = primers
    @target = normalize(target)
    @target_container = normalize(target_container)
  end

  def results
    potential_matches.select { |primer| primer.binds_to?(target) }
  end

  private

  attr_reader :primers, :target, :target_container

  def potential_matches
    (primers + primers.map(&:reverse_complement)).
      select { |primer| primer.in_container?(target_container) }
  end

  def normalize(sequence)
    sequence.downcase.gsub(/\s+/, "")
  end
end
