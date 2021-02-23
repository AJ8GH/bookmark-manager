feature 'deleting bookmarks' do
  scenario 'deleting a bookmark removes it from the list' do
    Bookmark.create(title: 'Test', url: 'http://test.com')

    visit '/bookmarks'
    expect(page).to have_link('Test', href: 'http://test.com')

    click_button 'Delete Bookmark'
    fill_in :title, with: 'Test'
    click_button 'Delete'
    expect(page).not_to have_link('Test', href: 'http://test.com')
  end
end
