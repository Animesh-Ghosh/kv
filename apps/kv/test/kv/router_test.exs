defmodule KV.RouterTest do
  use ExUnit.Case, async: true

  @tag :distributed
  test "routes requests across nodes" do
    assert KV.Router.route("hello", Kernel, :node, []) == :"foo@pop-os"
    assert KV.Router.route("world", Kernel, :node, []) == :"bar@pop-os"
  end

  test "raises on unknown entry" do
    assert_raise RuntimeError, ~r/could not find entry/i, fn ->
      KV.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end
