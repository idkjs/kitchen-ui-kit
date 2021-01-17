module.exports = {
  "stories": [
    "../src/**/*.stories.js"
  ],
  "addons": [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    // "storybook-preset-craco",
  ],
  webpackFinal: async (config, { configType }) => {
    const craConfig = require('./../config/webpack.config')('development');  
    config.module.rules.push({
      rules: [
        {
          test: /\.css$/,
          use: [
            {
              loader: require.resolve('postcss-loader'),
              options: {
                plugins: () => [
                  require('tailwindcss'),
                  require('autoprefixer'),
                ]
              }
            }
          ]
        }
      ]
    })
    return config;
  }
}