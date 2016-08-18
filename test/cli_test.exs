defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three retruned if three input" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "three returned if two input" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

end
