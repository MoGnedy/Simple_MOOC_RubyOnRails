# README

# Simple MOOC -> Ruby On Rails

* Ruby version
  ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
* Rails Version
  Rails 5.0.2
  
* Instructions

> 1- clone the App

```
git clone https://github.com/MoGnedy/Simple_MOOC_RubyOnRails.git
```

> 2- Install dependencies

```
bundle install
```

> 3- create database, migrate and seed database with users roles and admin user

```
rake db:create
rake db:migrate
rake db:seed
```

> 4-Set some environment variables in ~/.bathrc file to make reset password function work correctly

```
export SENDMAIL_PASSWORD=XXXXXXX
export SENDMAIL_USERNAME=email@example.com
export MAIL_HOST=localhost:3000
```

> Finally run the server and have fun
```
rails s
```


* # Mohamed Gnedy #
