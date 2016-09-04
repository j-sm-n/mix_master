require 'rails_helper'

RSpec.feature "User views a specific artist page" do
  scenario "they delete artist and are redirected to all artists" do
    artist_name       = "Mac Demarco"
    artist_image_path = "http://nme.assets.ipccdn.co.uk/images/2015MacDeMarco-PG-7220715.article_x4.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to have_current_path(artists_path)
    expect(page).to_not have_content(artist.name)
    expect(page).to have_content("Artist Deleted!")
  end
end
