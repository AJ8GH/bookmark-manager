feature 'user registration' do
  scenario 'registering when visiting for first time' do
    visit '/'
    click_button 'Register'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'password123'
    fill_in :confirm_password, with: 'password123'
    click_button 'Register'
    expect(current_path).to eq '/bookmarks'
  end

  scenario 'user is greeted by email' do
    visit '/'
    click_button 'Register'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'password123'
    fill_in :confirm_password, with: 'password123'
    click_button 'Register'
    expect(page).to have_content 'Welcome test@test.com'
  end
end
