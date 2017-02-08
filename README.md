# Simple blog

## Install
``` sh
$ bundle install
$ rake db:setup
```

## Description
Blog contains Posts. Each Post belongs to a certain Category. Each Post is tagged with one or more Tags and can be commented by both registered and anonymous visitors.  Categories should be organized into a tree structure. There should be the following kinds of users in the system:
* Administrator – the creator of the blog with all the application privileges granted.
* Visitor – everyone who comes at the site.
* Registered user – Visitor, which is registered within the site (including e.g. Administrator).

Common use case scenarios are the following:
* Visitors browsing the posts (filtering and sorting modes can be combined in any reasonable way).
  - Filtering Posts containing certain text (both in subject and body part).
  - Filtering Posts by Category.
  - Filtering Posts by Tags (Posts marked by one or more certain Tags at once).
* Visitor signup that moves him into the category of Registered users. The first registered user becomes the Administrator.
* Visitor authentication.
* Adding, editing and deleting of posts by the Administrator. When posting there should be an ability to select the Category (one of those added at the deployment stage) and choose Tags (either typed in or selected out the existing ones).
* Commenting by the Registered users.
* Comment moderation by the Administrator: accepting, declining and removal.
