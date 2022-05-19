// @ts-check
/// <reference path="./typings/postcss.d">

/**
 * @type {Partial<PostCSSConfig>}
 */
const PostCSSConfig = {
  plugins: [
    require('autoprefixer')(),
    require('@fullhuman/postcss-purgecss')({
      content: ['./**/*.html'],
    }),
  ],
};

module.exports = PostCSSConfig;
