# List all namespaces with a non-deleted entryKey (pagination not yet implemented for >10k items):
# 	{"method": "list", "params": {"options": {"team": "phoenix"}}}
#
# List all non-deleted entryKeys in a namespace (pagination not yet implemented for >10k items):
# 	{"method": "list", "params": {"options": {"team": "phoenix", "namespace": "pw-manager"}}}

defmodule KeybaseTools.KvStore.List do
  def get_map([]) do
    %{
      method: "list",
      params: %{}
    }
  end

  def get_map([namespace]) do
    %{
      method: "list",
      params: %{
        options: %{
          namespace: namespace
        }
      }
    }
  end

  def get_map([namespace, team | _]) do
    %{
      method: "list",
      params: %{
        options: %{
          namespace: namespace,
          team: team
        }
      }
    }
  end

  def list(_) do
    {:error, "<namespace>"}
  end
end
