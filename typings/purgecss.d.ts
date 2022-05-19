declare module '@fullhuman/postcss-purgecss' {
  import { Plugin } from 'postcss';

  function postcss(): Plugin;

  export = postcss;
}
