feature 'url validation' do
  scenario 'user sees a flash message' do
    visit('/bookmarks')
    click_button 'Add Bookmark'
    fill_in :title, with: 'Test'
    fill_in :url, with: 'invalid'
    click_button 'Submit'
    expect(page).not_to have_link('Test', href: 'invalid')
    expect(page).to have_content("That's not a valid url")
  end
end
