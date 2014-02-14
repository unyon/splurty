WebDev Environment with Vagrant
==================


Step 1: Download and install the tools
-------

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Sublime Text Editor](http://sublimetext.com/)
* [Putty SSH Client](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe) - **Windows OS only**.  Just download this file to your desktop so you can run it easy.


Step 2:  Download the dev environment
-----------

Download and unzip the following file: [firehose-vagrant](https://github.com/kenmazaika/firehose-vagrant/archive/master.zip).  This is where all your web development environment will live.

Step 3: Add the Box
--------

Download the Firehose Vagrant image, open up the Windows Command line in the directory you have the firehose.box downloaded and run the following commands.

```
vagrant box add firehose firehose.box
vagrant up
```

Step 4: Log into your virtual environment
-----------

Navigate to the directory where the vagrant folder lives and then run this:

```
vagrant ssh
cd /vagrant/src/firehose-test-app
rails s
```

Step 5: Accounts
------------

#### Generate SSH Key

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


Step 6: Test
---------

Open a web browser on your windows machine and go to: [http://127.0.0.1:3030](http://127.0.0.1:3030)