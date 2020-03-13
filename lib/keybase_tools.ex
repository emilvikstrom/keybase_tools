defmodule KeybaseTools do
  alias KeybaseTools.KvStore.{List, Get, Put, Delete}

  def main(["help"]) do
    IO.puts("Usage")
  end

  def main([operation | args]) do
    case operation(operation).get_map(args) do
      result when is_map(result) ->
        result
        |> Jason.encode!()
        |> call_keybase()

      {:error, error} ->
        IO.puts(error)
    end
  end

  def main(_) do
    main(["help"])
  end

  defp operation("list") do
    List
  end

  defp operation("get") do
    Get
  end

  defp operation("put") do
    Put
  end

  defp operation("delete") do
    Delete
  end

  defp call_keybase(json) do
    # args =
    #  ["kvstore", "api", "-m", "#{json}"]
    #  |> IO.inspect()
    #
    # System.cmd("keybase", ["kvstore api -m '#{json}'"], into: IO.stream(:stdio, :line))
    IO.puts("keybase kvstore api -m '#{json}'")
  end
end

# USAGE:
#   keybase kvstore api [command options]
#
# DESCRIPTION:
#   "keybase kvstore api" provides a JSON API to fast, encrypted key-value storage. The "entryKey" and "namespace" fields are visible to the Keybase servers, "entryValue" is encrypted with the per-team-key.
#
# If team is not specified, then the command defaults to using the logged-in user's implicit self-team (only your user can see and decrypt this).
#
# EXAMPLES:
#
