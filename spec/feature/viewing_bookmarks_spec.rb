feature 'viewing bookmarks' do
  before do
    allow(Bookmark).to receive(:all) do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec('SELECT * FROM bookmarks;')
      result.map { |row| row['url'] }
    end
  end

  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'seeing list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end


