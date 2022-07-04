// @ts-check

/**
 * @type {Partial<import('postcss-load-config').Config>}
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
