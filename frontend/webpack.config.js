const path = require("path")
const webpack = require('webpack')
const HtmlWebPackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
  entry: [
    'webpack-hot-middleware/client?reload=true',
    path.resolve(__dirname, "src/index.tsx")
  ],
  mode: "development",
  output: {
    filename: "[name]-bundle.js",
    path: path.resolve(__dirname, "dist"),
    publicPath: "/"
  },
  resolve: {
    extensions: ['*', '.js', '.jsx', '.ts', '.tsx']
  },
  devServer: {
    contentBase: path.resolve(__dirname, "dist"),
    port: 9000,
    hot: true,
    historyApiFallback: true
  },
  devtool: "source-map",
  module: {
    rules: [
      {
        test:  /\.(ts|tsx)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "awesome-typescript-loader"
          }
        ]
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      { test: /\.css$/, 
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          { loader: "css-loader" }
        ],
      },
      { test: /\.(otf|eot|woff|woff2|ttf|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        use: [
          {
            loader: "file-loader"
          }
        ]
      }
    ]
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: path.resolve(__dirname, "src/index.html")
    }),
    new MiniCssExtractPlugin({
      filename: 'common.css'
    }),
    new webpack.HotModuleReplacementPlugin()
  ]
}