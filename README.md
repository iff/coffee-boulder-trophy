# Coffee-Boulder-Trophy

This is a simple nodejs project for creating rankings at the annual Minimum
boulder competitions, replacing the python script (minimum-boulder-trophy).

At the moment the app provides a simple web interface to add data, store it
into a mongo database and visualize results.


## Requirements

The following tools are required to get the boulder-trophy app up and running:

 * [node.js](http://nodejs.org/) 0.6.x
 * [npm](http://npmjs.org/) 1.x
 * [mongodb](http://www.mongodb.org/) v2.0 or higher


## Quick start

After you install all dependencies (see above), use the following guide to get
the code and start the server:

    # Get the code
    git clone git@github.com:iff/coffee-boulder-trophy.git
    cd coffee-boulder-trophy

    # Install node packages (external dependencies)
    npm install

    # Create a directory for the DB
    mkdir data

    # Start mongo db
    mongod --dbpath data &

    # Start the server and open in browser (it runs on port 3355)
    ./node_modules/coffee-script/bin/coffee server.coffee
    open http://localhost:3355


## License

The code is under MIT license, see LICENSE.

