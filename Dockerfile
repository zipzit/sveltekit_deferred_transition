# https://jenyus.web.app/blog/2021-05-30-setting-up-a-development-environment-for-sveltekit-with-docker-and-compose
# Our Node base image
FROM node:17
# Set the Node environment to development to ensure all packages are installed
# ENV NODE_ENV development
# Change our current working directory
# WORKDIR /usr/src/app
# Copy over `package.json` and lock files to optimize the build process
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "yarn.lock*", "./"]
# update npm per feedback message from previous build
RUN npm install -g npm@8.1.4
# Install Node modules
RUN npm install
# Copy over rest of the project files
COPY . .
# Expose port 3000 for the SvelteKit app and 24678 for Vite's HMR
EXPOSE 3000
EXPOSE 24678
# Compile the program to the build folder
RUN npm run build
# Run the program from the build folder
CMD node build