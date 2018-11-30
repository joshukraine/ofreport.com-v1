![ofreport.com](https://s3.amazonaws.com/content.ofreport.com/ofr-logo-2017.png)

---

# OFReport.com

> [OFReport.com][ofreport] is our family blog, documenting our ministry in Ukraine.

## Overview

This site is a universal [Vue.js][vue] application built with [Nuxt.js][nuxt], and is deployed as a pre-generated static site on [Amazon S3][aws-s3]. In addition to Vue and Nuxt, several noteworthy supporting technologies have been used, including the following:

* [Tailwind CSS][tailwind]
* [Purgecss][purgecss]
* [Pug (formerly Jade)][pug]
* [Vuelidate][vuelidate]
* [Font Awesome 5 (Vue component)][fa5]

## Requirements

* [Node >= 8.x][node]
* [Yarn 1.7.x][yarn]

## Setup

To get started, clone/fork the repo, cd into it, and install the dependencies.

``` bash
$ yarn install
```

## Development

Nuxt uses [Webpack as its build tool][nuxt-assets], and is also pre-configured for [hot module replacement][hmr]. To begin, start the development server on `localhost:3000`:

```bash
$ yarn dev
```

## Static Build

In addition to deploying server-rendered apps, Nuxt also works great as a [static site generator][static-gen]. That's how we're using it here. To pre-render the entire site as static HTML, CSS, and JavaScript files, run this command:

```bash
$ yarn generate
```

The generated site will be output to the `dist/` folder.

## Local HTTP Server

Sometimes in development it can be helpful to run the statically generated site with a local web server, simulating a production environment. I have found [http-server][] to be a great choice. Here's how I build and serve the static site on my local machine.

First, install http-server globally if you don't already have it.

```bash
$ npm install http-server -g
```

Next, build the site as explained in the previous section.

```bash
$ yarn generate
```

Finally, move into the `dist/` folder and start the server.

```bash
$ cd dist/
$ http-server -p 8080
```

Visit `http://localhost:8080` and check out the site!

## Environment-specific Builds

Nuxt allows you to [define environment variables][env-property] which can be accessed at compile time by calling `process.env.YOUR_VARIABLE`. This is particularly useful for generating builds with specifics that differ between, for example, production and staging environments.

To generate a production build, run:

```bash
$ APP_ENV=production yarn generate
```

This will, among other things, set the robots meta tag to `index,follow`. If `APP_ENV` is set to anything else, the robots tag will be set to `noindex,nofollow`.

## Deployment

My preferred deployment solution for static sites is [Amazon S3][aws-s3]. It's super cheap, and provides lots of nice extras like a CDN with [CloudFront][aws-cloudfront] and a [free SSL certificate][aws-ssl].

Individual deploys are handled with the `bin/deploy` script, which basically wraps the [AWS CLI][aws-cli], using the `aws s3 sync` command to copy files up to the appropriate bucket. The `bin/deploy` script expects the environment to be passed as an argument.

```bash
# Deploy to staging
$ bin/deploy staging

# Deploy to production
$ bin/deploy production
```

The deploy script handles properly setting the aforementioned `APP_ENV` variable, as well as supplying the appropriate `robots.txt` file.

## Code Style and Linting

Project-specific JavaScript conforms to the [Standard][standard] code style.

[![JavaScript Style Guide](https://cdn.rawgit.com/standard/standard/master/badge.svg)](https://github.com/standard/standard)

JS linting is done with ESLint and extended with [eslint-plugin-vue][eslint-vue] and [eslint-plugin-standard][eslint-standard].

CSS linting is done with [stylelint][stylelint].

I use [Neovim][neovim] as my editor along with the [ALE][ale] plugin for asynchronous linting.


## Legal

&copy; 2018 Joshua and Kelsie Steele. Software is licensed under [MIT][license].

[ale]: https://github.com/w0rp/ale
[aws-cli]: https://aws.amazon.com/cli/
[aws-cloudfront]: https://aws.amazon.com/cloudfront/
[aws-s3]: https://aws.amazon.com/getting-started/projects/host-static-website/
[aws-ssl]: https://aws.amazon.com/blogs/aws/new-aws-certificate-manager-deploy-ssltls-based-apps-on-aws/
[env-property]: https://nuxtjs.org/api/configuration-env#the-env-property
[eslint-standard]: https://yarnpkg.com/en/package/eslint-plugin-standard
[eslint-vue]: https://yarnpkg.com/en/package/eslint-plugin-vue
[eto]: https://euroteamoutreach.org/
[fa5]: https://fontawesome.com/how-to-use/on-the-web/using-with/vuejs
[hmr]: https://webpack.js.org/concepts/hot-module-replacement/
[http-server]: https://www.npmjs.com/package/http-server
[license]: https://github.com/joshukraine/ofreport.com/blob/master/LICENSE
[neovim]: https://neovim.io/
[node]: https://nodejs.org/en/
[nuxt-assets]: https://nuxtjs.org/guide/assets
[nuxt]: https://nuxtjs.org/
[pug]: https://pugjs.org/
[purgecss]: https://www.purgecss.com/
[screenshot]: https://d2ppgd6w5akw3v.cloudfront.net/images/bibliya.net.ua-screenshot-2018-1200w.jpg
[standard]: https://standardjs.com/
[static-gen]: https://www.staticgen.com/nuxt
[stylelint]: https://stylelint.io/
[tailwind]: https://tailwindcss.com/
[vue-course]: https://www.udemy.com/share/10005w/
[vue]: https://vuejs.org/
[vuelidate]: https://monterail.github.io/vuelidate/
[yarn]: https://yarnpkg.com/en/docs/install
[ofreport]: https://OFReport.com/
