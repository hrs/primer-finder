require_relative "position"

class PrimerSearcher
  attr_reader :primers, :target, :target_container

  def initialize(primers:, target:, target_container:)
    @primers = primers
    @target = normalize(target)
    @target_container = normalize(target_container)
  end

  def target_position
    # Note that this only finds the first position of the target in the
    # container. It won't notice if there's more than one.
    start_pos = target_container.index(target)
    if start_pos
      Position.new(
        start_pos: start_pos,
        end_pos: start_pos + target.size
      )
    end
  end

  def results
    potential_matches.map { |primer|
      SearchResult.new(
        primer: primer,
        binding_length: primer.overlap(
          position: target_position,
          container: target_container
        )
      )
    }.select(&:successful?)
  end

  private

  def potential_matches
    primers + primers.map(&:reverse_complement)
  end

  def normalize(sequence)
    sequence.downcase.gsub(/\s+/, "")
  end
end
