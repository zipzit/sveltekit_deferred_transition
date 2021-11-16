# https://jenyus.web.app/blog/2021-05-30-setting-up-a-development-environment-for-sveltekit-with-docker-and-compose
# Our Node base image
FROM node:14.16.1​
# Set the Node environment to development to ensure all packages are installed
ENV NODE_ENV development
# Change our current working directory
WORKDIR /usr/src/app
# Copy over `package.json` and lock files to optimize the build process
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "yarn.lock", "./"]
# Install Node modules
RUN yarn
# Copy over rest of the project files
COPY . .
# Expose port 3000 for the SvelteKit app and 24678 for Vite's HMR
EXPOSE 3000
EXPOSE 24678
# Run `yarn dev` and set the host to 0.0.0.0 so we can access the web app from outside
CMD ["yarn", "dev", "--host", "0.0.0.0"]