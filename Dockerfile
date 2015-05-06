# Put this file in the root of your app, next to the Gemfile.

# This image includes multiple ONBUILD triggers which should cover most applications.
# The build will COPY . /usr/src/app, RUN bundle install, EXPOSE 3000, and set the default command to rails server.

FROM rails:onbuild
