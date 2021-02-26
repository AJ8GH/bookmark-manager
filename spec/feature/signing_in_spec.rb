feature 'signing in' do
  xscenario 'successful sign in' do
    User.create(email: 'test@test.com', password: 'Password123')

    visit '/'
    click_button 'Sign In'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'Password123'
    click_button 'Submit'

    expect(page).to have_content 'Welcome test@test.com'
  end
end
