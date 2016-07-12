

// Import all styles.. global and deps
import GlobalStyles from './global.styl';

// Deps
import React from 'react';
import { render } from 'react-dom';

// Modules
import { DemoDom } from './modules/demo';

document.write('<div id="app"></div>');
render(
	<DemoDom />,
	document.getElementById('app')
);
