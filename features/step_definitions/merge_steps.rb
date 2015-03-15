Given /^the blog is set up for non-admin$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'user',
                :password => 'potato',
                :email => 'potato@potato.com',
                :profile_id => 2,
                :name => 'user',
                :state => 'active'})
end

And /^I am logged in as a user$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'potato'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /I create an article with title "([^"]*)" and body "([^"]*)"/ do |title, body|
  fill_in 'article_title', :with => title
  fill_in 'article__body_and_extended_editor', :with => body
  click_button('Publish')
end 
