feature 'adding bookmarks' do
  scenario 'user can add a bookmark' do
    visit '/bookmarks'
    click_button 'Add Bookmark'
    fill_in :url, with: 'https://makersacademy.com/'
    fill_in :title, with: 'Makers'
    click_button 'Submit'
    expect(page).to have_link('Makers', href: 'https://makersacademy.com/')
  end
end
