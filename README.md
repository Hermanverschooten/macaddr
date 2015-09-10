Macaddr
=======

A Postgrex.Extension enabling the use of the macaddr data type.

Add this module as en extension when establishing your Postgrex connection:

      Postgrex.Connection.start_link(
        database: "macaddr_test",
        extensions: [{ Macaddr.Extension, {}}])

Then you can do Ecto.Migration like this:

      defmodule MyApp.Repo.Migrations.CreateComputer do
        use Ecto.Migration

        def change do
          create table(:computers) do
            add :mac, :macaddr
            # other fields
          end
        end
      end

You can also define Ecto.Models using the matching custom Ecto.Type:

      defmodule MyApp.Computer do
        use MyApp.Web, :model

        schema "computers" do
          field :mac, :Macaddr
          # other fields
        end
      end
