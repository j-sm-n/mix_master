require 'rails_helper'

RSpec.feature "User edits a song" do
  scenario "they see the changes they made" do
    artist = create(:artist)
    song = artist.songs.create(title: "My Kind of Woman")

    visit song_path(song)
    click_on "Edit"

    expect(page).to have_current_path(edit_song_path(song))

    fill_in "song_title", with: "My Kind of Man"
    click_on "Update Song"

    expect(page).to have_content("My Kind of Man")
    expect(page).to have_link(artist.name, href: artist_path(artist))
  end
end
