'use strict';

import React from 'react';
import Reflux from 'reflux';
import DemoActions from './demoActions';

export default Reflux.createStore({
	listenables: [DemoActions]
})
