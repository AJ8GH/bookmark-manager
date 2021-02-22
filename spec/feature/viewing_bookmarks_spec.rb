feature 'viewing bookmarks' do
  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'seeing list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'https://fantasy.premierleague.com/'
    expect(page).to have_content 'https://www.amazon.co.uk/'
    expect(page).to have_content 'https://www.youtube.com/'
  end
end
