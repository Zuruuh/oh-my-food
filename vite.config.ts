import { resolve } from 'path';
import { defineConfig } from 'vite';
import glob from 'fast-glob';

export default defineConfig(() => ({
  build: {
    minify: true,
    assetsDir: 'assets',
    outDir: 'dist',
    emptyOutDir: true,
    rollupOptions: {
      input: glob
        .sync(['./pages/**/*.html', '!dist'])
        .map((entry: string) => resolve(__dirname, entry)),
    },
    target: 'modules',
  },
}));
