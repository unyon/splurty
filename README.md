WebDev Setup with Vagrant
==================

First a little about passwords: Read all of this
------------------

Sometimes you will be prompted for a password (computer loging password, user account, etc.) when you're installing programs using the terminal window.  When you start typing the password, it will look like it nothing has been typed (eg. nothing will display on the screen as type).  That's totally fine. Your password is being entered, just not shown to you. So keep typing and press enter when you're done typing.  In case you type your password wrong it will prompt you to type in your password again.  Why? So nobody can look over your shoulder and see your password or know how many characters your password has.  


Run Through the Guide For Your Machine
-------------

## [Windows Web Dev Setup](windows.md)
## [Mac Web Dev Setup](mac.md)


Additional Info
---------------

#### database.yml


This installer will install postgresql in such a way that you'll need to adjust your database.yml. Add your username as 'postgres', your password as 'password' (don't include the single quotes!). You will also need to add an additional line typing 'host: localhost' (again, don't include the single quotes!).

When you're done you should have three different sections in you database.yml file that look similar to the examples below. What's important is that your name after 'database:' is different then in our example below.

We'll go over all the details of the database.yml file on Saturday.

_NOTE: indentation is super important - make sure they line up and rather than copy & pasting this, type this in)_:

```
development:
  adapter: postgresql
  encoding: unicode
  database: YOUR_APPLICATION_NAME_HERE_development
  pool: 5
  username: postgres
  password: password
  host: localhost
  
  
test:
  adapter: postgresql
  encoding: unicode
  database: YOUR_APPLICATION_NAME_HERE_development
  pool: 5
  username: postgres
  password: password
  host: localhost
  
  
production:
  adapter: postgresql
  encoding: unicode
  database: YOUR_APPLICATION_NAME_HERE_development
  pool: 5
  username: postgres
  password: password
  host: localhost
```
