#
# Delete an entry:
# 	{"method": "del", "params": {"options": {"team": "phoenix", "namespace": "pw-manager", "entryKey": "geocities"}}}
#
# Delete an entry (also supports specifying the revision):
# 	{"method": "del", "params": {"options": {"team": "phoenix", "namespace": "pw-manager", "revision": 4, "entryKey": "geocities"}}}

defmodule KeybaseTools.KvStore.Delete do
  def get_map([namespace, key]) do
    %{
      method: "delete",
      params: %{
        options: %{
          "namespace" => namespace,
          "entryKey" => key
        }
      }
    }
  end

  def get_map([namespace, key, team]) do
    %{
      method: "delete",
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
