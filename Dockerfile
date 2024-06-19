# Use the official Elixir image
FROM elixir:1.15

# Set environment and environment variables
ENV MIX_ENV=prod
ENV SECRET_KEY_BASE='2I7H9DHPz3+252GJ5Yn1/seOxo14Uy0VUFXPv/4GpARnKuVT365E5w/LvG29vKNa'

# Install Node.js for asset building
# RUN apt-get update && \
#     apt-get install -y nodejs npm && \
#     apt-get clean

# Install Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /app

# Copy the mix files
COPY mix.exs mix.lock ./

# Install Elixir dependencies
RUN mix deps.get

# Copy the rest of the application code
COPY . .

# Install Node.js dependencies
# RUN npm install --prefix ./assets

# Compile assets
# RUN npm run deploy --prefix ./assets
RUN mix phx.digest

# Compile the Elixir project
RUN mix compile

# Expose the Phoenix server port
EXPOSE 4000

# Set environment variables for production
ENV MIX_ENV=prod
ENV PORT=4000

# Run the Phoenix server
CMD ["mix", "phx.server"]
