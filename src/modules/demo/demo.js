'use strict';

import React from 'react';
import view from './demo.jade';
import css from './demo.styl';

export default React.createClass({
	render: view
});

let object = {
	name: 'hola'
}

console.log({
	...object,
	age: 'Jaime',
})
