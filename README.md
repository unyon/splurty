WebDev Setup with Vagrant
==================

First a little about passwords: Read all of this
------------------

Sometimes your machine will prompt you for a password for the user account on your in the terminal window.  When you start typing the password, it will look like it isn't being typed (nothing will display on the screen as you press keys).  What happens here is the terminal doesn't display the characters you type, but it is keeping track of it, so just enter your password (assume you type it correctly) and press enter.  If you type the wrong one it will prompt you for it again.  This prevents someone from looking over your shoulder and seeing the password that you type or knowing how many characters your password is.  


Run Through the Guide For Your Machine
-------------

## [Windows Web Dev Setup](windows.md)
## [Mac Web Dev Setup](mac.md)


Additional Info
---------------

#### database.yml

We'll go over what this means Saturday.

This installer will install postgresql in such a way that you'll need to adjust your database.yml file to look like this in each of the three sections (development, test, production).  Also be sure to adjust the database section.  _NOTE: indentation is super important - make sure they line up and rather than copy & pasting this, type this in)_:

```
development:
  adapter: postgresql
  encoding: unicode
  database: YOUR_APPLICATION_NAME_HERE_development
  pool: 5
  username: postgres
  password: password
  host: localhost
```