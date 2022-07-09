# Oh MY Food!

## Installation

To setup the project locally you need to meet the following requirements:

- NodeJS (Version >17, prefer installation using [NVM](https://github.com/nvm-sh/nvm))
- PNPM (Version >7, install with `npm i -g pnpm`)

Once both of these softwares are installed, you can run `pnpm install` to download all the project dependencies.  
Your project should be ready for local development.

## Development

To run locally the project during development, you can run `pnpm run dev`, which will create  
a local dev server using ViteJS and Parcel. Default url should be http://localhost:3000 if available.  
Once server is open, you can head to http://localhost:3000/pages/index.html to see the homepage.

## Production

To build the project for production, just push on the main branch and a GitHub actions workflow will handle everything.  
If for some reason you need to build the project locally, here are the steps you will need to follow in order to replicate a prod build:

```shell
pnpm run prod /oh-my-food/ # This will build all assets in the *dist* folder using vitejs and parcel config
bash ./scripts/fs-router.sh # This will ensure the built files won't have a /pages/ prefix on prod & updates all the links and urls in our apps so they won't end with ".html"
```

And your _dist_ folder should be good to go.
