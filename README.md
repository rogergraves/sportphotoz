# Welcome to the SportPhotoz App
The soon to be premier app for purchasing race/marathon photos

The Sportphotoz app is built on:
    * Ruby 2.1.5
    * Rails 4.2.1
    * Postgresql
    * Hosted by heroku with asset storage yet to be determined
    * Continuous Integration service by yet to be determined
    * Application monitoring by NewRelic (later)
    * Code complexity and security monitoring by CodeClimate (later)

# Recommended New Development Machine Install (Mac)
1. Install the latest version of XCode
2. Install the optional Command Line Tools in XCode
3. Install the latest version of Homebrew: brew.sh/
4. Install the latest version of RVM: rvm.io/
5. Install Ruby from terminal: 'rvm install 2.1.5'
6. Install posgtresql from terminal: 'brew install postgresql' and follow on screen instructions (very important)
7. Create postgresql superuser postgres: 'createuser postgres -s'
8. Clone the git repo in terminal: 'git clone git@github.com:rogergraves/sportphotoz.git'
9. Go into directory 'cd sportphotoz' and run 'bundle'
10. Set up the local development database through 'rake db:create'
11. Run local database migrations through 'rake db:migrate'
12. Install the Heroku toolbelt at https://toolbelt.heroku.com/ and then restart your terminal
12. Should be ready to roll: 'rails server'

# Beginner's Guide to Changing Code
Every time you are ready to start work, do the following terminal commands in the wyzyr directory:

        $ git smart-pull
        $ bundle
        $ rake db:migrate
        $ rake db:test:prepare
        $ rails server

At this point you can point your browser to localhost:3000/ and start development work. To stop the server click CNTL-C.

To check to make sure your code changes didn't break anything critical:

        $ rspec

Green dots are good, red F's are bad. Note that sometimes other people may have broken the build, so use your best judgement if the automated test errors were caused by your code or not (for example if you undo changes and re-run the test).

To push your code changes to the repo:

        $ git add .
        $ git commit -am "Message describing what changes you made [#XXXXXXX]"
        $ git push origin master

Note: replace XXXXXXX with the Pivotal Tracker's story ID (very important).

If you run into problems pushing, it's probably because somebody pushed other commits between the time you last pulled and the current time that you want to push:

        $ git smart-pull
        $ git push origin master

# Heroku Deploys
After you've installed the heroku toolbelt at https://toolbelt.heroku.com/ and created a heroku account, you'll need to log in from terminal in the sportphotoz directory:

        $ heroku login
        Enter your Heroku credentials.
        Email: adam@example.com
        Password (typing will be hidden):
        Authentication successful.

You can then add heroku to your git remote, if it's not already there:

        $ git remote add production git@heroku.com:sportphotoz.git

Then to do a deploy to production:

        $ git push production master