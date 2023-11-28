module.exports = function (api) {
  api.cache(true);
  return {
    plugins: [
      'react-native-reanimated/plugin',
      "transform-remove-console",
    ],
    presets: ['babel-preset-expo'],
  };
};
