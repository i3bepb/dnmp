const path = require('path');
const glob = require('glob');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const TerserJSPlugin = require('terser-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');

module.exports = {
    context: __dirname,
    mode : 'production',
    entry: {
        app: ['./src/js/main.js', './src/scss/general.scss']
            // .concat(glob.sync('./src/scss/*'))
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'js/[name]-[chunkhash:6].js'
    },
    module: {
        rules: [
            {
                test: /\.scss$/,
                use: [
                    {loader: MiniCssExtractPlugin.loader},
                    {
                        loader: 'css-loader',
                        options: {
                            url:false
                        }
                    },
                    {loader: 'sass-loader'}
                ]
            },
            {
                test: /\.css$/i,
                use: [
                    {loader: MiniCssExtractPlugin.loader},
                    {
                        loader: 'css-loader',
                        options: {
                            url:false
                        }
                    }
                ]
            },
        ]
    },
    plugins: [
        // Чистит папку dist перед сборкой, тем самым удаляет старые файлы
        new CleanWebpackPlugin({
            verbose: true,
            // cleanAfterEveryBuildPatterns: ['**/styles-*.js'],
            protectWebpackAssets:false
        }),
        // Формирует манифест - файл в котором новые имена собранных файлов есть
        new ManifestPlugin(),
        // Минификация css
        new MiniCssExtractPlugin({
            filename: '[name]-[chunkhash:6].css',
            publicPath:'css'
        }),
    ],
    optimization: {
        minimizer: [
            new TerserJSPlugin({
                test: /\.js(\?.*)?$/i,
            }),
            new OptimizeCSSAssetsPlugin({})
        ],
    }
};