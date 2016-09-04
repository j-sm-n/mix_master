require 'rails_helper'

RSpec.feature "User visits artists page" do
  scenario "they see all artists in database listed" do
    Artist.create(
                  name: "Tame Impala",
                  image_path: "http://www.abc.net.au/triplej/artists/tame_impala/2015/600.jpg"
                  )
    Artist.create(
                  name: "Mac Demarco",
                  image_path: "http://nme.assets.ipccdn.co.uk/images/2015MacDeMarco-PG-7220715.article_x4.jpg"
                  )
    artist_1 = Artist.first
    artist_2 = Artist.last
    visit artists_path

    expect(page).to have_link artist_1.name, href: artist_path(artist_1)
    expect(page).to have_link artist_2.name, href: artist_path(artist_2)
  end
end
