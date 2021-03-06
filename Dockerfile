FROM apify/actor-node-basic

# Copy source code
COPY . ./

# Install default dependencies, print versions of everything
RUN npm --quiet set progress=false \
 && npm install --only=prod --no-optional \
 && echo "Installed NPM packages:" \
 && npm list \
 && echo "Node.js version:" \
 && node --version \
 && echo "NPM version:" \
 && npm --version

# This will start working only after upgrading to 0.20.5
ENV APIFY_DISABLE_OUTDATED_WARNING 1

# By default, the apify/actor-node-basic image uses "npm start" to run the code.
# You can override this behavior using the CMD instruction here:
# CMD [ "npm", "start" ]
