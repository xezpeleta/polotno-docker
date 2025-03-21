FROM node:lts AS build

WORKDIR /app

# Install git and download the repo
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/polotno-project/polotno-studio.git . && \
    npm install && \
    npm run build

# Expose the port
EXPOSE 5173
# Set the command to run the app
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]