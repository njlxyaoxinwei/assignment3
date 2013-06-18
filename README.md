# Assignment 3

Your task for assignment #3 is to take this shell of an application (which we created in class week #3) and expand it with the basic functionality of a reddit-type site. Once you complete this assignment, you'll have pretty much all the skills needed to build a basic web-application (the only thing missing will be a 'modern' javascript UI).

This assignment is pretty long and complicated (by design). If you feel like this assignement is too hard, that's ok! Please get in touch, and I'll work with you if you need more time, more guidance, etc.

You will benefit greatly by reading through the [Rails Tutorial](http://ruby.railstutorial.org/chapters) and completeing the exercises, but it's not technicaly required. The tutorial covers a lot of material direcly related to building this app, though you will have to adapt a good amount, and 'make it your own'.

http://tinyurl.com/mduv3p4

## If You Get Stuck

Getting stuck is normal! Programming is hard, but thankfully it's mostly a team sport :)

When the tutorial doesn't cover something, check the [Rails Tutorial](http://ruby.railstutorial.org/chapters), [Rails Guides](http://guides.rubyonrails.org), and search the web. If you're still stuck, ask on Piazza (that's totally encouraged!) You can even ask anonymously if you want.

Also, I'm always happy to meet with you during office hours (and to schedule additional ones if you can't make the usual times.)

## Getting Started

Fork this project (by clicking the 'Fork' button on the github page). This creates a copy of the project in your github account. Then clone that copy to your local machine with `git clone` (make sure to use the URL for your fork, and not this original).

If you have teammates, only one of you should fork it. That person should then go to the repository settings on GitHub and add their teammates as collaborators. **Teams are very strongly encouraged.**

## Submitting

This assignment is due **April 5th**, but I ask that you check in one week before **(March 27th)** to get feedback and show progress. 

**To submit:** Edit this readme file to include your name at the top (and any teamates), and then commit all your changes and push them to github. (Multiple commits as you work are not only allowed, but encouraged.)


## Feature Requirements

1. A relatively nice style, nothing fancy, but at least something more than the default stlying you get out of the box.) I suggest you use Twitter Bootstrap (see Chapter 5 of the Rails Tutorials Book).
2. The application should support users, including signing up, logging in/out, and the following attributes: name, email
3. Users should be able to create and view posts. Posts have a title, a link, and an optional description.
4. The home page should show a list of the top 20 posts (in terms of # of upvotes).
5. Users should be able to upvote or downvote posts. (no more than once per post per user)
6. Users should be able to comment on posts. Comments should be 'flat' (i.e. no threading or comments as 'replies' to other comments). Comments don't need upvotes/downvotes. These should be visible on the post 'show' page.
7. Users should be able to see all posts and comments by another given user (on the user 'show' page)
8. Bonus points for adding categories, where each post belongs in exactly one category. (You can pre-define what the categories are, or let users add new ones, up to you). 
    * If you want to add other features, that's fine too, but please talk to me first!

## Tips

* Worth repeating: When the tutorial doesn't cover something, check the [Rails Tutorial](http://ruby.railstutorial.org/chapters), [Rails Guides](http://guides.rubyonrails.org), and search the web. If you're still stuck, ask on Piazza (that's totally encouraged!) You can even ask anonymously if you want.
* For creating the **post** model, you can use the scaffold generator, but I think you'll learn more if you do it by hand this time.
* For feature #5 (up/downvotes), there are a number of ways of modeling this. I suggest creating one 'vote' model, which has attributes for whether it's up or down, what post it's for (`post_id`), and what user created it (`user_id`). You're welcome to experiment with other approaches.
* In terms of Rails model relationships, here's how I'd go about it (you can try something else, though):
    * **Post** `belongs_to :user`, `has_many :comments`, and `has_many :votes`
    * **User** `has_many :posts`, `has_many :comments`, `has_many :votes`
    * **Comments** `belong_to :users`, `belong_to :posts`
    * **Votes** `belong_to :users`, `belong_to :posts`