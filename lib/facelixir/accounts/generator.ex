defmodule Facelixir.Accounts.Generator do

  @names ["Jan", "Maria", "Andrzej", "Aneta", "Adrian", "Tomasz"]

    def perform(count) do 
        0..count
        |> Enum.each(fn(_) -> add_user() end)
    end

    defp add_user() do 
        name = @names |> Enum.random()
        email = String.downcase(name) <> "@example.com"
        password = :crypto.strong_rand_bytes(10) |> Base.url_encode64

        Facelixir.Accounts.create_user(%{name: name, email: email, password: password})
        IO.inspect "User #{name} created!"
    end
end


    