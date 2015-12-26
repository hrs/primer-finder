require "rails_helper"

feature "Users can search for primers" do
  context "CSV contains a matching primer" do
    scenario "the results page shows only the matching primer" do
      visit root_path

      fill_out_search_form(
        target: "ttaaaa",
        container: "cacacattaaaacccccgtgtgt",
        csv: "spec/fixtures/primers.csv"
      )

      expect(page).to have_content("primer_1")
      expect(page).not_to have_content("primer_2")
    end
  end

  context "CSV doesn't contain a matching primer" do
    scenario "the results page reports no matches" do
      visit root_path

      fill_out_search_form(
        target: "ttagga",
        container: "cacacattaggacccccgtgtgt",
        csv: "spec/fixtures/primers.csv"
      )

      expect(page).to have_content("Couldn't match any of these primers.")
    end
  end

  context "Container doesn't contain the target region" do
    scenario "the results page displays an error" do
      visit root_path

      fill_out_search_form(
        target: "aaaaa",
        container: "gggggggggggg",
        csv: "spec/fixtures/primers.csv"
      )

      expect(page).to have_content("That target doesn't seem to be in the container you provided.")
    end
  end

  private

  def fill_out_search_form(container:, csv:, target:)
    fill_in("target", with: target)
    fill_in("target_container", with: container)
    attach_file("primer_csv", File.expand_path(csv))
    click_on "Find primers!"
  end
end
