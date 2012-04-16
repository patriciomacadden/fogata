# Smoke signals

Smoke signals is an open source group chat. Basically, Smoke signals is an open source [Campfire](http://campfirenow.com/) clone.

## Main features

* [Gravatar](http://gravatar.com/) support
* Emoji support, following [emoji-cheat-sheet](http://www.emoji-cheat-sheet.com/)
* URL conversion support (if you write http://google.com it turns to [http://google.com](http://google.com))
* File uploads
* .. and many more to come!

## Quick start

1. Clone the repo
```
git clone git@github.com:patriciomacadden/smoke_signals.git
```
2. Run `bundle install` to install the dependencies
3. Configure your databases in `config/database.yml`
4. Configure where you will run the [faye](https://github.com/faye/faye) process in `config/private_pub.yml` (using [private_pub](https://github.com/ryanb/private_pub), of course)
5. Run `gem install foreman` to install the [foreman](https://github.com/ddollar/foreman) gem
6. Run `bundle exec rake db:create` to create the database
7. Run `bundle exec rake db:migrate` to create the database schema
8. Run `bundle exec rake db:seed` to create the admin user
9. Run `foreman start` to start the background processes
10. Run `rails server` to start the rails server
11. Visit localhost:3000 to start using Smoke signals!

## Contributing

1. Fork it.
2. Create a branch (`git checkout -b my_awesome_branch`)
3. Commit your changes (`git commit -am "Added some magic"`)
4. Push to the branch (`git push origin my_awesome_branch`)
5. Send pull request

## Pending features

* Improve default style, for God's sake!
* Authentication using [devise](https://github.com/plataformatec/devise) or [omniauth](https://github.com/intridea/omniauth)? (Would it be nice?)
* Sounds!
* API (maybe using [grape](https://github.com/intridea/grape)?)
* Themeable interface (maybe using [themes_for_rails](https://github.com/lucasefe/themes_for_rails)?)
* Search
* Transcript (messages by day)
* File deletion (maybe in the transcript)
* Improve the authorization on controllers (not so good use of [cancan](https://github.com/ryanb/cancan))
* Allow mp3 uploads

## License

Copyright (c) 2012 Patricio Mac Adden

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
