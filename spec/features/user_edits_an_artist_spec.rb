require 'rails_helper'

RSpec.feature "User edits a current artist" do
  scenario "they see the edit form to edit an artist" do
    Artist.create(
                  name: "Tame Impala",
                  image_path: "http://www.abc.net.au/triplej/artists/tame_impala/2015/600.jpg"
                  )
    artist = Artist.find(Artist.last.id)
    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: "Mac Demarco"
    click_on "Update Artist"

    expect(page).to have_content "Mac Demarco"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
