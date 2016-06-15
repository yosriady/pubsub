# Pubsub

Publish-Subscribe in Elixir.

## Setup

```
git clone git@github.com:yosriady/pubsub.git
cd pubsub
mix deps.get
mix deps.compile
iex -S mix
```

## Try it

```
iex> Pubsub.subscribe(:test)
{:ok, #PID<0.141.0>}
iex> Pubsub.subscribe(:test)
{:ok, #PID<0.143.0>}
iex> Pubsub.publish(:test, "hey")
"hey"
"Got \"hey\" in process #PID<0.141.0>"
"Got \"hey\" in process #PID<0.143.0>"
```

## Reference

Pubsub relies on [`gproc`](https://github.com/uwiger/gproc/wiki/The-gproc-api), which does most of the heavy lifting.
