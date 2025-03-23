# KVServer

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kv_server` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kv_server, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/kv_server>.

### Notes

Running distributed tests are not straight-forward.

```bash
# first terminal session in the kv app
iex --sname bar -S mix

# second terminal session (could be from the root directory)
elixir --sname bar -S mix test --trace
```

That's because the setup is not repeatable without shutting down the bar node and starting it up again.
An example is the `test "server interaction" test in `kv_server_test.exs`.
On the 1st run, the "shopping" bucket is created on the bar node with all the modifications on the bucket (putting the "eggs" key, reading the "eggs" key and then finally deleting the "eggs" key).
On the 2nd run, the "shopping" bucket still exists (if the bar node has not been shut down). However, the test still expects the bucket to not be created.
