
module.exports = {
	entry: "./entry.js",
	output: {
		path: __dirname,
		filename: "bundle.js"
	},
	devtool: 'source-map',
	module: {
		loaders: [
			{
				test: /\.jade$/, loader: 'jade-react-loader'
			},
			{
				test: /\.scss$/,
				loaders: ['style', 'css', 'sass']
			},
			{
				test: /\.css$/,
				loader: "style!css"
			},
			{ test: /\.styl$/, loader: 'style-loader!css-loader!stylus-loader' },
			{
				test: /\.js$/,
				exclude: /(node_modules|bower_components)/,
				loader: 'babel-loader', // 'babel-loader' is also a legal name to reference
				query: {
					presets: [ 'es2015', 'react' ],
					plugins: [ "transform-es2015-destructuring", "transform-object-rest-spread" ]
				}
			}
		]
	}
};
