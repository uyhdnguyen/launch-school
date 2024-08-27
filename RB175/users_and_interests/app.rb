=begin

When a user loads the home page, they should be redirected to a page that lists all of the users' names. Load the users from the users.yaml file (content below).

Each of the users' names should be a link to a page for that user.

On each user's page, display their email address. Also display their interests, with a comma appearing between each interest.

At the bottom of each user's page, list links to all of the other users pages. Do not include the user whose page it is in this list.

Add a layout to the application. At the bottom of every page, display a message like this: "There are 3 users with a total of 9 interests."

Update the message printed out in #5 to determine the number of users and interests based on the content of the YAML file. Use a view helper method, count_interests, to determine the total number of interests across all users.

Add a new user to the users.yaml file. Verify that the site updates accordingly.

Problem:
========
- create a homepage:
  - redirect to new page that list all of the users' names
  - each users' names should link to a page for that user
- create each user' page:
  - display email address
  - display interests with comma between each interest
  - page's bottom list links to all other user pages excluding its own user
- create layout.erb that display "There are 3 users with a total of 9 interests."
  - create dynamic layout that count the total of users and total of interest to update at the bottom of each page based on the information in yaml file
- add a new user to users.yaml file to confirm everything works

Algorithm:
==========
- create erb file for each user
- create erb file for layout
- create homepage
  - load info from yaml file

=end

require 'yaml'

users_info = YAML.load_file("users.yaml")

p users_info