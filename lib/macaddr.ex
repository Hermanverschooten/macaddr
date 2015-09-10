defmodule Macaddr do
  @behaviour Ecto.Type

  @moduledoc """
    Definition for the macaddr module.

    How to use in an Ecto.Model

      defmodule MyApp.Computer do
        use MyApp.Web, :model

        schema "computers" do
          field :mac, :Macaddr
          # other fields
        end
      end
  """

  def type, do: :macaddr

  defdelegate blank?, to: Ecto.Type

  def cast(nil), do: :error

  def cast(mac), do: {:ok, to_string(mac)}
  def load(mac), do: {:ok, to_string(mac)}
  def dump(mac), do: {:ok, to_string(mac)}

end
