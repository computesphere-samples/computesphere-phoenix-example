# Use the official Elixir image
FROM elixir:1.15

ENV MIX_HOME=/opt/mix
ENV MIX_ENV=prod
ENV SECRET_KEY_BASE='2I7H9DHPz3+252GJ5Yn1/seOxo14Uy0VUFXPv/4GpARnKuVT365E5w/LvG29vKNa'
ENV PORT 80

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /app

COPY mix.exs mix.lock ./

RUN mix deps.get

COPY . .

RUN mix assets.deploy
RUN mix phx.digest

RUN mix do compile

EXPOSE 80

CMD ["mix", "phx.server"]
