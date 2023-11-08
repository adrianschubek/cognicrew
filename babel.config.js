module.exports = function(api) {
  plugins: [
    'react-native-reanimated/plugin',
  ],
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
  };
};
