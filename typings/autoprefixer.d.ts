declare module 'autoprefixer' {
  import { Plugin } from 'postcss';

  function autoprefixer(): Plugin;
  export = autoprefixer;
}
