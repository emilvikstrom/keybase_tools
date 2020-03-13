# Get an entry (always returns the latest revision, non-existent entries have a revision of 0):
# 	{"method": "get", "params": {"options": {"team": "phoenix", "namespace": "pw-manager", "entryKey": "geocities"}}}
#

defmodule KeybaseTools.KvStore.Get do
  def get_map([namespace, key]) do
    %{
      method: "get",
      params: %{
        options: %{
          "namespace" => namespace,
          "entryKey" => key
        }
      }
    }
  end

  def get_map([namespace, key, team | _]) do
    %{
      method: "get",
      params: %{
        options: %{
          "namespace" => namespace,
          "entryKey" => key,
          "team" => team
        }
      }
    }
  end

  def get_map(_) do
    {:error, "<namespace, key>"}
  end
end
