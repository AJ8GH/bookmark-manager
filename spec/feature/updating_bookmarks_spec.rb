feature 'updating bookmarks' do
  xscenario 'entering new title updates title but not url' do
    visit '/bookmarks'
    click_button 'Add Bookmark'
    fill_in :title, with: 'Test'
    fill_in :url, with: 'http://test.com'
    click_button 'Submit'

    expect(page).to have_link('Test', href: 'http://test.com')

    click_button 'Update'

    fill_in('title', with: 'Updated')
    fill_in('url', with: 'http://test.com')

    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'

    expect(page).to have_link('Updated', href: 'http://test.com')
    expect(page).not_to have_link('Test', href: 'http://test.com')
  end
end
