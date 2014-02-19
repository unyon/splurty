WebDev Setup with Vagrant
==================

First a little about passwords: Read all of this
------------------

Sometimes your machine will prompt you for a password for the user account on your in the terminal window.  When you start typing the password, it will look like it isn't being typed (nothing will display on the screen as you press keys).  What happens here is the terminal doesn't display the characters you type, but it is keeping track of it, so just enter your password (assume you type it correctly) and press enter.  If you type the wrong one it will prompt you for it again.  This prevents someone from looking over your shoulder and seeing the password that you type or knowing how many characters your password is.  

Step 1 - Create accounts if you haven't already
--------

First go to [GitHub.com](http://github.com) and [Heroku.com](http://Heroku.com) and create an account there


Step 2: Download and install the tools
-------

I suggest following these installers in this order, because the last installer will have you retart your machine.  When it prompts you to, click "Yes"

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Sublime Text Editor](http://sublimetext.com/)
* [Putty SSH Client](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe) - Just download this file to your desktop so you can run it easily.
* [Vagrant](http://www.vagrantup.com/downloads.html) 
 
 
Step 3:  Get the dev environment
-----------

**If you have a Firehose Flash Drive**:  copy the vagrant folder onto your __Desktop__.

**If you do not have a Firehose Flash Drive**: download and unzip the following file: [firehose-vagrant](https://github.com/kenmazaika/firehose-vagrant/archive/master.zip) to your __Desktop__ and rename the folder `vagrant`.  This is where all your web development environment will live.

Download the firehose.box file, and save it in your `Desktop/vagrant` folder.
 
Step 4: Add the Box
--------
 
Open up the **Windows Command Prompt**: click the **Start** button ![Picture of the Start button](http://imgur.com/GFYgPUT.png). In the Search box, type _Command Prompt_, and then, in the list of results, double-click Command Prompt.

A command prompt will come up, and then run the following two commands:

```
cd Desktop\vagrant
```
 
then run this next command, it may take a few moments to complete:

```
vagrant box add firehose firehose.box
```


Step 5: Turn on your Web Dev Environment
-------

In the command prompt window you've been using, type this command, again this may take a few moments to complete:

```
vagrant up
```

Now click the X button and close the Command Line window.
 
Step 6: Log into your dev environment
-----------
 
Launch the **Putty** application that was place onto your Desktop.

Open up putty
 
* In the **Host Name** (or IP Address) enter: 127.0.0.1
* In the **Port** to the right of it enter: 2222
* Press the **Open** button.
* You will be prompted for a user.  Enter: __vagrant__
* You will be prompted for a password.  Enter: __vagrant__
 
 
Step 7: Accounts
------------

#### Generate SSH Key

 Inside the putty window run, _important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line_:
 
```
eval `ssh-agent -s`
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
```
 
#### Configure Heroku with SSH Keys
 
This will prompt you for your heroku username and password.  Enter that here.

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

##Amazon AWS services##

_We need an amazon developer account for some image storage space on Amazons S3 service (this will cost you nothing)_

* Sign-up and create an account for [Amazon Web Services](http://aws.amazon.com/). Anything we'll do over the weekend will cost you nothing, so don't worry about your credit card being charged.

 
Step 8: Test
---------
 
 In the putty window run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

 ```
cd /vagrant/src/firehose-test-app
rails s
```


Open a web browser on your windows machine and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)

If you want to return to a window where you can enter commands in this Putty window, go into it and hold CTRL+C.  This will stop your webpage from working, but allow you to enter new commands.


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

#### A Note about Restarting Your Machine

When you restart your machine and go to connect to your development environment you will probably get a "Connection Error".  If this happens, you'll need to make sure to startup up the dev environment (Step 5).  To do this:

Open up the **Windows Command Prompt**: click the **Start** button ![Picture of the Start button](http://imgur.com/GFYgPUT.png). In the Search box, type _Command Prompt_, and then, in the list of results, double-click Command Prompt.

A command prompt will come up, and then run the following two commands:

```
cd Desktop\vagrant
```

Then enter this command, it may take a few moments to complete:

```
vagrant up
```

Now click the X button and close the Command Line window, and you can try to connect to your dev environment again.

