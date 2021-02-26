feature 'filtering by tag' do
  scenario 'click on tag, see all bookmarks for that tag' do
    bookmark1 = Bookmark.create(title: 'BM 1', url: 'http://test1.com')
    bookmark2 = Bookmark.create(title: 'BM 2', url: 'http://test2.com')
    bookmark3 = Bookmark.create(title: 'BM 3', url: 'http://test3.com')

    tag1 = Tag.create(content: 'Tag 1')
    tag2 = Tag.create(content: 'Tag 2')
    tag3 = Tag.create(content: 'Tag 3')

    bm_tag1 = BookmarkTag.create(tag_id: tag1.id, bookmark_id: bookmark1.id)
    bm_tag2 = BookmarkTag.create(tag_id: tag2.id, bookmark_id: bookmark2.id)
    bm_tag3 = BookmarkTag.create(tag_id: tag3.id, bookmark_id: bookmark3.id)

    visit '/bookmarks'
    click_link 'bm_tag1'

    expect(page).to have_link('BM 1', href: 'http://test1.com')
  end
end
