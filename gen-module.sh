#! /bin/bash

DEST=src/modules

if [[ -n "$1" ]]; then
	NAME=$1
	mkdir $DEST/$NAME
	echo -e "'use strict';

import React from 'react';
import Reflux from 'reflux';
import view from './"$NAME"View.jade';
import styles from './"$NAME"Styles.styl';
import "$NAME"Store from './"$NAME"Store';

export default React.createClass({
	mixins: [Reflux.connect("$NAME"Store, '"$NAME"store')],
	render: view
});
" > $DEST/$NAME/"$NAME"Dom.js
	echo -e "
h1
	margin: 20px
" > $DEST/$NAME/"$NAME"Styles.styl
	echo "h1 $NAME component" > $DEST/$NAME/"$NAME"View.jade
	echo -e "'use strict';

import "$NAME"Dom from './"$NAME"Dom.js';

module.exports = {
	"$NAME"Dom
};
" > $DEST/$NAME/index.js

echo -e "
/*
 * Module dependencies
 */

import Reflux from 'reflux';
import "$NAME"Actions from './"$NAME"Actions';

var "$NAME"Store = Reflux.createStore({
    listenables: ["$NAME"Actions],
    init: function() {
    },
	 "$NAME"s: [],
    fetch: function() {
      this.trigger(this."$NAME"s)
    }
});

export default "$NAME"Store;
" > $DEST/$NAME/"$NAME"Store.js

echo -e "
/*
 * Module dependencies
 */

import Reflux from 'reflux';

let "$NAME"Actions = Reflux.createActions([
  'fetch'
]);

export default "$NAME"Actions;
" > $DEST/$NAME/"$NAME"Actions.js
else
	echo "Usage: ./gen <moduleName>"
fi

