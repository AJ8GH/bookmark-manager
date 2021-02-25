feature 'creating a tag and seeing it in bookmarks page' do
  scenario 'add tag to bookmark, see it in page' do
    Bookmark.create(title: 'Test', url: 'http://test.com')

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Tag'
    fill_in :tag, with: 'Test tag'
    click_button 'Submit'
    expect(page).to have_content 'Test tag'
  end
end
