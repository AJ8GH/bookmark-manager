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

feature 'Adding tag at point of creation' do
  scenario 'clicking on tag, seeing bookmarks' do
    visit '/bookmarks'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Test'
    fill_in :url, with: 'http://test.com'
    fill_in :tag, with: 'Test tag'
    click_button 'Submit'

    expect(page).to have_content 'Test tag'
  end
end
