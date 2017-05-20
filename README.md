![ofreport.com](https://s3.amazonaws.com/content.ofreport.com/ofr-logo-2017.png)

---

OFReport.com
============

[![Build Status](https://travis-ci.org/joshukraine/ofreport.com.svg?branch=master)](https://travis-ci.org/joshukraine/ofreport.com) [![Dependency Status](https://gemnasium.com/badges/github.com/joshukraine/ofreport.com.svg)](https://gemnasium.com/github.com/joshukraine/ofreport.com)

[OFReport.com](http://OFReport.com/) is our family blog, documenting our ministry in Ukraine.

This site was built using [Middleman](https://middlemanapp.com/).

Requirements
------------

* [Middleman 4.x](https://middlemanapp.com/basics/install/)
* [Ruby 2.x](https://github.com/rbenv/rbenv#readme)
* [Node 6.x](https://github.com/creationix/nvm#readme)
* [Gulp CLI](https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md#getting-started)

Setup
-----

To get started, clone the repo, cd into it, and run the setup script.

```sh
$ bin/setup
```

Development
-----------

This project uses [Gulp](http://gulpjs.com/) with Middleman's new [`external_pipeline`](https://middlemanapp.com/advanced/external-pipeline/) feature introduced in v4.

    # Run the development server with Gulp
    $ bundle exec middleman server
    
    # Build the site (also invokes Gulp)
    $ bundle exec middleman build

Environments
------------

Middleman has two default environments: `development` and `production`. This app is configured to run the external pipeline (Gulp in our case) in both. There are times, however, when the external pipeline should not run. Two good examples are tests and the console. We therefore define two additional environments: `test` and `console`.

Custom environments can be invoked on the command line with `-e` flag like so:

    # Start the console in the console enviroment
    $ bundle exec middleman console -e console

Code for custom environments is stored in `environments/<your-custom-env>.rb`. Note that custom environments can be invoked without the existence of a corresponding file in the `environments/` directory. If, for example, you merely wanted to start a server without the default `development` configs, you could run `middleman server -e <anything-here>`.

For completeness, all five environments used in this app have corresponding files:

```sh
environments/
├── console.rb
├── development.rb
├── production.rb
├── staging.rb
└── test.rb
```

Tests
-----

Testing is done with Rspec. Run the tests like so:

    $ bin/rspec spec/

Aliases
-------

Consider adding the following to your `.bashrc` or `.zshrc` file:

```sh
mm='bundle exec middleman'
mmb='bundle exec middleman build --clean'
mmc='bundle exec middleman console -e console'
mms='bundle exec middleman server'
```

Deployment
----------

OFReport.com is currently deployed on Amazon S3. [Detailed instructions](http://docs.aws.amazon.com/gettingstarted/latest/swh/website-hosting-intro.html) are available from Amazon.

Legal
-----

Blog content is copyrighted by Joshua and Kelsie Steele. Software is licensed under [MIT](https://github.com/joshukraine/ofreport.com/blob/a0438cc49039eb5d90e26beb1043fd76886caf1b/LICENSE).
