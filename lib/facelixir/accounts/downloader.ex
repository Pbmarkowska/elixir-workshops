defmodule Facelixir.Accounts.Downloader do
    use Tesla
    
    plug(Tesla.Middleware.DecodeJson, engine_opts: [])

  
      def perform() do
        case get("https://randomuser.me/api/") do
            {:ok, %Tesla.Env{body: data}} ->
                user_data = data["results"] |> List.first()
                name = user_data["name"]["first"] |> String.capitalize()
                email = user_data["email"]
                password = :crypto.strong_rand_bytes(10) |> Base.url_encode64
                image = user_data["picture"]["thumbnail"]
                Facelixir.Accounts.create_user(%{name: name, email: email, password: password, image: image})
                IO.inspect "User #{name} created!"
            _ ->
                IO.inspect("OOps!")
                
        end 

      end
  
    #   defp add_user() do 
    #       name = @names |> Enum.random()
    #       email = String.downcase(name) <> "@example.com"
    #       password = :crypto.strong_rand_bytes(10) |> Base.url_encode64
  
    #       Facelixir.Accounts.create_user(%{name: name, email: email, password: password})
    #       IO.inspect "User #{name} created!"
    #   end
  end
  
  
      