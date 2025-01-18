# Use official Ruby image
FROM ruby:3.0.0

# Set the working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock /app/

# Install dependencies
RUN bundle install

# Copy the rest of the application files
COPY . /app

# Install PostgreSQL client for database operations
RUN apt-get update -qq && apt-get install -y postgresql-client

# Expose the Sinatra port
EXPOSE 4567

# Run the application
CMD ["ruby", "app.rb"]
