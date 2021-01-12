module.exports = {
  "stories": [
    "../src/**/*.stories.js"
  ],
  "addons": [
    "@storybook/addon-links",
    "@storybook/addon-essentials",
    // "@storybook/preset-create-react-app",
    "storybook-preset-craco",
  ],
  webpackFinal: async (config, { configType }) => {
    config.devServer = {
      hot: true,
      transportMode: 'http',
      injectClient: false,
      port: 2000
    };
    
    return config;
  }
}