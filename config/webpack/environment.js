const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.append("Providee", new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ["Popper", "default"]
}))

module.exports = environment
