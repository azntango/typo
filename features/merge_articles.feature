Feature: Merge articles
As an admin
So that articles are more organized
I want to be able to merge articles together

Scenario: A non-admin canot merge articles
Given the blog is set up for non-admin
And I am logged in as a user
Given I am on the new article page
And I create an article with title "Totoro" and body "Best Movie Evar" 
Then I should be on the admin content page
When I go to the home page
Then I should see "Totoro"
When I follow "Totoro"
Then I should not see "Merge Articles"

Scenario: Combine text of both articles
Given the blog is set up
And I am logged into the admin panel
And I go to the new article page
And I create an article with title "Totoro" and body "Best Movie Evar" 
And I create an article with title "Howl's Moving Castle" and body "Best Movie Evar also" 
Then I should be on the admin content page
When I go to the home page
When I follow "Totoro"
And I fill in 'merge_id' with "2"
And I click "Merge Articles"
Then I should be on the merged article
And I should see "Best Movie Evar"
And I should see "Best Movie Evar also"

Scenario: One author per merged article
Given the blog is set up
And I am logged into the admin panel
And I go to the new article page
And I create an article with title "Totoro" and body "Best Movie Evar" 
And I create an article with title "Howl's Moving Castle" and body "Best Movie Evar also" 
Then I should be on the admin content page
When I go to the home page
When I follow "Totoro"
And I fill in 'merge_id' with "2"
And I click "Merge Articles"
Then I should be on the merged article
And I should see "Totoro"
And I should not see "Howl's Moving Castle"

Scenario: One title per merged article
Given the blog is set up
And I am logged into the admin panel
And I go to the new article page
And I create an article with title "Totoro" and body "Best Movie Evar" 
And I create an article with title "Howl's Moving Castle" and body "Best Movie Evar also" 
Then I should be on the admin content page
When I go to the home page
When I follow "Totoro"
And I fill in 'merge_id' with "2"
And I click "Merge Articles"
Then I should be on the merged article
And I should see "admin"