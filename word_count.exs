filename =
    "File to count the words from: "
    |> IO.gets()
    |> String.trim()

body = File.read!(filename)

count = 
    body
    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.count()

IO.inspect(count)