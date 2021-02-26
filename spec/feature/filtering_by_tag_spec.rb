feature 'filtering by tag' do
  scenario 'click on tag with single bookmark' do
    bookmark = Bookmark.create(title: 'BM', url: 'http://test1.com')
    tag = Tag.create(content: 'Tag')
    BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark.id)

    visit '/bookmarks'
    click_link 'Tag'

    expect(page).to have_link('BM', href: 'http://test1.com')
  end

  scenario 'click on tag with multiple bookmarks' do
    bookmark1 = Bookmark.create(title: 'BM 1', url: 'http://test1.com')
    bookmark2 = Bookmark.create(title: 'BM 2', url: 'http://test2.com')
    bookmark3 = Bookmark.create(title: 'BM 3', url: 'http://test3.com')

    tag = Tag.create(content: 'Tag')

    BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark1.id)
    BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark2.id)
    BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark3.id)

    visit '/bookmarks'
    click_link 'Tag'

    expect(page).to have_link('BM 1', href: 'http://test1.com')
    expect(page).to have_link('BM 2', href: 'http://test2.com')
    expect(page).to have_link('BM 3', href: 'http://test3.com')
  end
end
