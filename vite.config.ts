import { resolve } from 'path';
import type { UserConfig /*ViteDevServer */ } from 'vite';

const page = (file: string) => resolve(__dirname, 'pages', `${file}.html`);

const config: UserConfig = {
  resolve: {
    alias: {
      '@': resolve(__dirname, './'),
    },
  },
  publicDir: 'pages',
  plugins: [
    // {
    //   name: 'router',
    //   apply: 'serve',
    //   configureServer(viteDevServer: ViteDevServer) {
    //     return () => {
    //       viteDevServer.middlewares.use(async (req, _, next) => {
    //         if (req && req.originalUrl && req.originalUrl === '/') {
    //           req.url = '/index.html';
    //           req.originalUrl = '/index.html';
    //         }
    //
    //         next();
    //       });
    //     };
    //   },
    // },
  ],
  build: {
    minify: true,
    rollupOptions: {
      input: {
        main: page('index'),
      },
    },
    target: 'ESNEXT',
  },
};

export default config;
