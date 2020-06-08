filename =
  "File to count the words from (h for help):\n"
  |> IO.gets()
  |> String.trim()

if filename == "h" do 
  IO.puts """

Usage: [filename] - [flags]
flags
-l     displays line count
-c     displays character count
-w     displayscword count (default)
Multiple flags may be used. Example usage to display line and character count:

somefile.txt -lc

"""
else
  parts = String.split(filename, "-")
  filename = List.first(parts) |> String.trim()
  flags = case Enum.at(parts, 1) do
    nil -> ["w"]
    chars -> String.split(chars, "") |> Enum.filter(fn x -> x != "" end)
  end

  body = File.read!(filename)
  lines = String.split(body, ~r{(\r\n|\n|\r)})
  words = 
    body
    |> String.split(~r{(\\n|[^\w'])+})
    |> Enum.filter(fn char -> char != "" end)
  chars = 
    body
    |> String.split("") 
    |> Enum.filter(fn char -> char != "" end)

  Enum.each(flags, fn flag -> 
    case flag do
      "l" ->    "lines #{lines}" 
      "w" ->    "words #{words}"
      "c" ->    "chars #{chars}"
      _ -> nil
    end
  end)
end