feature 'deleting bookmarks' do
  scenario 'deleting a bookmark removes it from the list' do
    Bookmark.create(title: 'Test', url: 'http://test.com')

    visit '/bookmarks'
    expect(page).to have_link('Test', href: 'http://test.com')

    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Test', href: 'http://test.com')
    expect(page).not_to have_content 'Sinatra'
  end
end
