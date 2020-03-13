# Put an entry for yourself:
# 	{"method": "put", "params": {"options": {"namespace": "pw-manager", "entryKey": "geocities", "entryValue": "all my secrets"}}}
#
# Put an encrypted entry for anyone in team phoenix:
# 	{"method": "put", "params": {"options": {"team": "phoenix", "namespace": "pw-manager", "entryKey": "geocities", "entryValue": "all my secrets"}}}
#
# Put an entry (specifying a non-zero revision enables custom concurrency behavior, e.g. 1 will throw an error if the entry already exists):
# 	{"method": "put", "params": {"options": {"team": "phoenix", "namespace": "pw-manager", "entryKey": "geocities", "revision": 1, "entryValue": "all my secrets"}}}
#

defmodule KeybaseTools.KvStore.Put do
  def get_map([namespace, key, value]) do
    %{
      method: "put",
      params: %{
        options: %{
          "namespace" => namespace,
          "entryKey" => key,
          "entryValue" => value
        }
      }
    }
  end

  def get_map([namespace, key, value, team]) do
    %{
      method: "put",
      params: %{
        options: %{
          "namespace" => namespace,
          "entryKey" => key,
          "entryValue" => value,
          "team" => team
        }
      }
    }
  end

  def get_map(_) do
    {:error, "<namespace, key, value>"}
  end
end
