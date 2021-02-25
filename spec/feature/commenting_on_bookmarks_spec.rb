feature 'commenting on bookmarks' do
  scenario 'user adds comment to bookmark' do
    bookmark = Bookmark.create(title: 'Test', url: 'http://test.com')

    visit '/bookmarks'
    click_button 'Add Comment'
    
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in :comment, with: 'This is a nice bookmark'
    click_button 'Submit'

    expect(first('.bookmark')).to have_content 'This is a nice bookmark'
  end
end
