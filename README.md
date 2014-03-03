node-webkit-tomster-seed
========================
[![Gittip](https://img.shields.io/gittip/Kerrick.png)](https://www.gittip.com/Kerrick/)

A Foundation for a cross-platform Desktop Application using tools you probably never heard of.

These tools include:

- Single Page App
    - Handlebars for templating
    - CoffeeScript for your programming language
    - SCSS for your styles
    - Ember.js for rapid and scalable app development
    - ZURB Foundation for base styles
- Build Tools
    - Brunch for building your assets
    - Grunt for building your app
    - Bower for managing your dependencies
- Desktop Application
    - node-webkit for a desktop app with web technologies
        - Node.js for filesystem access and npm
        - Chromium for the DOM and UI rendering

#TL;DR?

- No this isn't a developer joke. It works. 
- `brunch new https://github.com/Kerrick/node-webkit-tomster-seed MyApp` to get you started.
- `npm run compiler` assembles your application into `/_public` and watches file changes.
- `npm run app` starts your application locally. 
- `npm run deploy` builds your app for windows, osx and linux. the binaries are placed in `/dist` after building. 
- `bower install <frontend-module>` for any frontend-related stuff. jQuery, Underscore, and so on. 
- `npm install my-module` **inside of `app/assets`** to install node.js modules. 
- see the [wiki](https://github.com/Kerrick/node-webkit-tomster-seed/wiki) for advanced stuff.

#Workflow - detailed

###0. Prerequisites

You need the following stuff installed on your machine: 
- [Node.js & NPM](http://nodejs.org/) (see the instructions for your operating system. Ensure that globally installed NPM modules are in your PATH!)
- Windows Users: Use a Git Bash or the [PowerShell](http://en.wikipedia.org/wiki/Windows_PowerShell) instead of CMD.exe !
- Linux Users: You may have to do a [symlink](https://github.com/rogerwang/node-webkit/wiki/The-solution-of-lacking-libudev.so.0). 
- Git. (Brunch and Bower depend on Git to work.) Windows users: try [this](http://git-scm.com/), there is a good usable CLI included which should work with the workflow out-of-the-box. The primitive CMD.exe is currently NOT supported. 
- [Brunch](http://brunch.io/) via a global npm installation: `npm install -g brunch`.
- [Bower](http://bower.io/) via a global npm installation: `npm install -g bower`.

###1. Bootstrap a new Desktop App!

```
brunch new https://github.com/Kerrick/node-webkit-tomster-seed MyApp
```

*This may take a few minutes depending on your hardware and internet connection, since this git repo will be cloned, a bunch of npm modules will be installed, including the somewhat big [node-webkit](https://github.com/rogerwang/node-webkit), and several bower modules afterwards.*

###2. Develop an Ember.js App on Steroids!

`cd MyApp`. Place your typical application code under `/app`. So: 

- `/app/styles` contains all your stylesheets as SCSS files. You may look into `/app/styles/app.scss` when fine-tuning your included CSS-related components.
- `/app/scripts` is the folder for your coffeescript application logic, especially your Ember.js stuff. The mighty Ember.js Router is defined in `/app/app.coffee` and includes `Ember.Application.create()` and the url route mapper. 
- `/app/partials` contains your Emblem templates which are compiled and merged into the Ember.js templates object. The main index file is located at `/app/index.emblem` and will be compiled to an actual `index.html` file.
- `/app/assets` is the catch-all directory for everything else, like images or fonts. The whole directory, including the folder-hierarchy, is copied **as is** into the final application folder. *If you want to use npm modules inside your application, install them here, and NOT in the toplevel folder!* Also, the `/app/assets/package.json` is used to describe and build your application, NOT the toplevel `/package.json`!

*The App-level structure is basically the same as [ember-app-kit](https://github.com/stefanpenner/ember-app-kit/).*

All this assembling stuff is managed for you automatically when you run the following command: 

```npm run compiler```

While this task is running, every change in your `/app` folder triggers an efficient partial rebuild of the relevant files. Any `bower install <frontend-module>` triggers this, too. 

To run your app locally, just enter: 

```npm run app```

###3. Add more modules and plugins!

Gone are the days of drag'n'droppin' your jQuery plugins from diverse websites into your script folders. Just use [Bower](http://bower.io/) for anything "browser related". Think of it as a NPM for the frontend. Any components installed by bower are saved in `bower_components` and automatically inserted in the compilation process. 

###4. Test ALL the things!

Since your desktop application is basically just an Ember.js app, you can use [Karma](http://karma-runner.github.io/0.10/plus/emberjs.html), which is awesome for testing Ember.js apps end-to-end. *(ToDo: configure karma to fire up node-webkit instead of chromium.)*

###5. Deploy your App!

When you're done building your awesome app, just type 

```npm run deploy```

and you'll have your final application folders located in `/dist` for each major operating system. When performing this task the first time, it'll take several minutes to download the necessary node-webkit binaries per target system. 

*So far only tested on OSX and Windows 7/8. The application icon and several minor features still require some work, have a look at [grunt-node-webkit-builder](https://github.com/mllrsohn/grunt-node-webkit-builder) if you want to give a helping hand.*

#Licence

**MIT.** You can assign any licence you want to your built apps, however you should pick the GPL if you are awesome *([like lighttable did](https://news.ycombinator.com/item?id=7024626))*. 

#Feedback

- Just use the issues section to discuss features or report bugs.
- If you have general questions not related to this project, you may tweet to [@KerrickLong](https://twitter.com/KerrickLong) (that's me.).

#Donate!

If you like what you see, feel free to [tip me on GitTip](https://www.gittip.com/Kerrick/).
