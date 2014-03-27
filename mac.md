Mac Setup with Vagrant
==================

This will run you through the steps to configure your web development environment using the vagrant install process.

Step 1: Create accounts if you haven't already
--------

### Part A

First go to [GitHub.com](http://github.com) and create an account. 

### Part B

Then go to [Heroku.com](http://Heroku.com) and create an account there as well.


Step 2:  Get the files for your development environment
-----------

**Go get a Firehose Flash Drive**:  copy the vagrant folder onto your __Desktop__.  --> Move on to step 3!

**If you do not have a Firehose Flash Drive (this will be a long donwload)**: download and unzip the following file: [firehose-vagrant](https://github.com/kenmazaika/firehose-vagrant/archive/master.zip) to your __Desktop__ and rename the folder `vagrant`.  This is where all your web development environment will live. Also download the firehose.box file here, and save it in your `Desktop/vagrant` folder.


Step 3: Install the tools
-------

**If you used a firehose flash-drive:**
Go to your vagrant folder on your desktop and open it up. Inside the vagrant folder open up the programs folder and inside of it the mac folder (vagrant > programs > mac).

* Double click on VirtualBox.pkg and follow the instructions (you're clicking continue most of the time)
* Double click on Sublime Text 2.0.2.dmg and follow the instructions (you're clicking continue most of the time)
* Double click on Vagrant.pkg and follow the instructions (you're clicking continue most of the time)

**--> Move on to Step 4.**


**If you didn't use a firehose flash-drive - download the tools below:**

I suggest following these installers in this order, because the last installer will have you retart your machine.  When it prompts you to, click "Yes".

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Sublime Text Editor](http://sublimetext.com/)
* [Vagrant](http://www.vagrantup.com/downloads.html) 
 
 

 
Step 4: Add the Box
--------
 
Open up the **Terminal Window**: Hold CTRL+Spacebar, in the Spotlight type 'Terminal' and hit the enter key.

A terminal window will come up, and then run the following two commands:

```
cd ~/Desktop/vagrant
```
 
then run this next command, it may take a few moments to complete:

```
vagrant box add firehose firehose.box
```


Step 5: Turn on your Web Dev Environment
-------

In the terminal you've been using, type this command, again this may take a few moments to complete:

```
vagrant up
```
 
Step 6: Log into your dev environment
-----------

To log into your web-dev environment follow the following steps:

__First__:  double click the vagrant folder on your desktop:

<img src="http://i.imgur.com/dVMQWUX.png" alt="Vagrant Folder" style="width: 300px;"/>


__Second__: the finder window opens double click the `Launch Mac Web Dev
   Environment`.

![vagrant-folder](http://i.imgur.com/5s5S7L1.png)

__Third__: Then you'll be prompted with a terminal window inside your web
development environment that looks like this:

![web-dev-environment](http://i.imgur.com/zQC0NKz.png)

This brings you into your web dev environment ready to run commands.


Step 7: Accounts
------------

#### Generate SSH Key

 Inside the web development terminal window, where it says `[Web Dev]` in blue, run the following lines one by one. _important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line_:
 
```
eval `ssh-agent -s`
```
```
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
```
```
ssh-add ~/.ssh/id_rsa
```
 
#### Configure Heroku with SSH Keys
 
This will prompt you for your heroku username and password.  Enter that here.

```
heroku login
```
```
heroku keys:add
```
 
#### Configure Github with SSH Keys
 
```
curl "https://raw2.github.com/kenmazaika/firehose-vagrant/master/github-key.rb" > ~/.firehose-github.rb && ruby ~/.firehose-github.rb
```

Then adjust these to have your name and email address inside the double quotes:

```
git config --global user.email "you@example.com"
```
```
git config --global user.name "Your Name"
```

##Amazon AWS services##

_We need an amazon developer account for some image storage space on Amazons S3 service (this will cost you nothing)_

* Sign-up and create an account for [Amazon Web Services](http://aws.amazon.com/). Anything we'll do over the weekend will cost you nothing, so don't worry about your credit card being charged.

 
Step 8: Test
---------
 
 In the web development terminal window,  where it says `[Web Dev]` in blue, run this, _important note: after you run `rails s` it won't give you the prompt to continue to enter commands. This is by design, so move onto the next step even if it looks like it's just hanging_:

```
cd /vagrant/src/firehose-test-app
```
```
rails s
```


Open a web browser on your windows machine and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)

If you want to return to a window where you can enter commands in web development terminal window, go into it and hold CTRL+C.  This will stop your webpage from working, but allow you to enter new commands.



Additional Info
---------------

#### A Note about Restarting Your Machine

When you restart your machine and go to connect to your development environment you will probably get a "Connection Error".  If this happens, you'll need to make sure to startup up the dev environment (Step 5).  To do this:

Open up the **terminal window**.

A command prompt will come up, and then run the following two commands:

```
cd ~/Desktop/vagrant
```

Then enter this command, it may take a few moments to complete:

```
vagrant up
```

#### How to log into your web development environment

When you want to log into your web development environment in a new terminal tab or window, open up the tab.  Then you'll want to move into the web development locations:

```
cd ~/Desktop/vagrant
```

Then once you're there, you can change the terminal window from a regular one, to the web development one by typing the following:

```
vagrant ssh
```
