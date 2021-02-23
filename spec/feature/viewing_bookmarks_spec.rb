feature 'viewing bookmarks' do

  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'seeing list of bookmarks' do
    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
    Bookmark.create(title: 'Destroy', url: 'http://www.destroyallsoftware.com')

    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
  end
end


