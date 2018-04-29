
module.exports = {
  entry: './src/main.dart',
  output: { filename: 'bundle.js' },
  module: {
    rules: [
      { test: /\.dart$/, loader: 'dart-loader' }
    ]
  }
}
