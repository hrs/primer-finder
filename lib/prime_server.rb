require "csv"
require "sinatra"

class PrimeServer < Sinatra::Base
  configure do
    set :root, File.join(File.dirname(__FILE__), "..")
  end

  error 400 do
    "That URL looks invalid. Sorry. =("
  end

  error 500 do
    "Oh no, an internal server error! What have you done?!"
  end

  get "/" do
    erb :index
  end

  post "/results" do
    @matches = PrimerSearcher.new(
      primers: CsvParser.new(params[:primer_csv][:tempfile]).primers,
      target: params[:target],
      target_container: params[:target_container]
    ).results

    erb :results
  end
end
