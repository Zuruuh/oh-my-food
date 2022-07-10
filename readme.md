# Oh My Food!

## Installation

To setup the project locally you need to meet the following requirements:

- Bash (Either use Linux/Macos, or WSL if you are using Windows)
- NodeJS (Version >17, prefer installation using [NVM](https://github.com/nvm-sh/nvm))
- PNPM (Version >7, install with `npm i -g pnpm`)

Once both of these softwares are installed, you can run `pnpm install` to download all the project dependencies.  
Your project should be ready for local development.

## Development

To run locally the project during development, you can run `pnpm run serve`, which will create  
a local dev server using ViteJS and Parcel. Default url should be http://localhost:3000 if available.  
Once server is open, you can head to http://localhost:3000 to see the homepage.

To update your SCSS assets on update, use the command ``pnpm run watch:css`` to rebuild the ``styles.css`` files whenever you save an scss file.

## Production

To build for production, simply run ``pnpm run build`` and your production-ready website should be located in the _dist_ folder.
