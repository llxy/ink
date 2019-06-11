FROM elixir:1.8.2-otp-22-alpine

RUN apk add npm

WORKDIR /app
COPY . .

ENV MIX_ENV prod
RUN echo "use Mix.Config" > config/prod.secret.exs
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get
RUN mix compile
RUN cd assets && npm install && ./node_modules/.bin/webpack --mode production
RUN mix phx.digest

CMD ["mix", "phx.server"]
