Setting Up A WebDev Environment with Vagrant
==================

First a little about passwords: Read all of this
------------------

Sometimes your machine will prompt you for a password for the user account on your in the terminal window.  When you start typing the password, it will look like it isn't being typed (nothing will display on the screen as you press keys).  What happens here is the terminal doesn't display the characters you type, but it is keeping track of it, so just enter your password (assume you type it correctly) and press enter.  If you type the wrong one it will prompt you for it again.  This prevents someone from looking over your shoulder and seeing the password that you type or knowing how many characters your password is.  

Step 1 - Create accounts if you haven't already
--------

First go to [GitHub.com](http://github.com) and [Heroku.com](http://Heroku.com) and create an account there


Step 2: Download and install the tools
-------
 
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Sublime Text Editor](http://sublimetext.com/)
* [Putty SSH Client](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe) - **Windows OS only**.  Just download this file to your desktop so you can run it easy.
* [Vagrant](http://www.vagrantup.com/downloads.html) - After this installs you may need
 
 
Step 3:  Get the dev environment
-----------

**If you have a Firehose Flash Drive**:  copy the vagrant folder onto your __Desktop__.

**If you do not have a Firehose Flash Drive**: download and unzip the following file: [firehose-vagrant](https://github.com/kenmazaika/firehose-vagrant/archive/master.zip) to your __Desktop__ and rename the folder `vagrant`.  This is where all your web development environment will live.

Download the firehose.box file, and save it in your `Desktop/vagrant` folder.
 
Step 4: Add the Box
--------
 
open up the Windows Command line in the directory you have the firehose.box downloaded and run the following commands.
 
```
vagrant box add firehose firehose.box
```

Step 5: Turn on your Web Dev Environment
-------

```
vagrant up
```
 
Step 6: Log into your virtual environment
-----------
 
Navigate to the directory where the vagrant folder lives and then run this:
 
```
vagrant ssh
```
 
This will pop up information about the Host, Port, Username and Private Key Location.
 
Open up putty
 
* In the **Host Name** (or IP Address) enter: 127.0.0.1
* In the **Port** to the right of it enter: 2222
* Click on the left Connection > SSH > Auth.  Where it says "Private key for authentication" browse for the file that was listed in the terminal.
* You will be prompted for a user.  Enter: __vagrant__
* You will be prompted for a password.  Enter: __vagrant__
 
 
Step 7: Accounts
------------

#### Generate SSH Key

 In putty run:
 
```
eval `ssh-agent -s`
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
```
 
* Go to [github.com](http://github.com) and create an account
* Go to [heroku.com](http://heroku.com) and create and verify your account
 
#### Configure Heroku with SSH Keys
 
```
heroku login
heroku keys:add
```
 
#### Configure Github with SSH Keys
 
```
curl "https://raw2.github.com/kenmazaika/firehose-vagrant/master/github-key.rb" > ~/.firehose-github.rb && ruby ~/.firehose-github.rb
```

Then adjust these to have your name and email address inside the double quotes:

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

 
 
Step 8: Test
---------
 
 In Putty run:

 ```
cd /vagrant/src/firehose-test-app
rails s
```

Open a web browser on your windows machine and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)






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




