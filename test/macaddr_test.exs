defmodule MacaddrTest do
  use ExUnit.Case, async: true
  import Macaddr.TestHelper
  alias Postgrex.Connection, as: P

  setup do
    options = Keyword.merge(conn_options, [extensions: [{Extension.Macaddr, {}}]])
    {:ok, pid} = P.start_link(options)
    {:ok, [pid: pid]}
  end

  test "encode and decode mac address", context do
    assert [["a0:b1:c2:d3:e4:f5"]] =
      query(context[:pid], "SELECT $1::macaddr", ["a0b1c2d3e4f5"])

    assert [["a0:b1:c2:d3:e4:f5"]] =
      query(context[:pid], "SELECT $1::macaddr", ["A0B1C2D3E4F5"])

    assert [["a0:b1:c2:d3:e4:f5"]] =
      query(context[:pid], "SELECT $1::macaddr", ["a0-b1-c2-d3-e4-f5"])
  end

end
