feature 'updating bookmarks' do
  xscenario 'entering new title updates title but not url' do
    visit '/bookmarks'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Test bookmark'
    fill_in :url, with: 'http://test.com'
    click_button 'Submit'

    expect(page).to have_link('Test', href: 'http://test.com')

    first('.bookmark').click_button('Update')
    fill_in('title', with: 'Updated')
    fill_in('url', with: 'http://updated.com')

    click_button 'Submit'

    visit '/bookmarks'

    expect(page).not_to have_link('Test bookmark', href: 'http://test.com')
    expect(page).to have_link('Updated', href: 'http://updated.com')
  end
end
