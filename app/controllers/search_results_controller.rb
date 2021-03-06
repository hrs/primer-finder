class SearchResultsController < ApplicationController
  def create
    searcher = PrimerSearcher.new(
      primers: CsvParser.new(params[:primer_csv].tempfile).primers,
      target: params[:target],
      target_container: params[:target_container]
    )

    @sorted_matches = searcher.results.sort_by(&:binding_length).reverse
    @target = searcher.target
  rescue PrimerSearchError => e
    flash.alert = e.message
    redirect_to root_path
  end
end
