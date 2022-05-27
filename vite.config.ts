import { resolve } from 'path';
import { defineConfig } from 'vite';

const page = (file: string) => resolve(__dirname, 'pages', `${file}.html`);

export default defineConfig(() => ({
  publicDir: 'pages',
  build: {
    minify: true,
    assetsDir: 'assets',
    outDir: 'dist',
    rollupOptions: {
      input: [
        page('index'),
        page('restaurants/la-palette-du-gout'),
        page('restaurants/la-note-enchantee'),
        page('restaurants/a-la-francaise'),
        page('restaurants/le-delice-des-sens'),
      ],
    },
    target: 'ESNEXT',
  },
}));
