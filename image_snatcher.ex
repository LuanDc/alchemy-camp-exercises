defmodule ImageSnatcher do
  defp create_directory do
    case File.mkdir("./images") do
      {:ok} ->
        IO.puts("./images directory successfully created")
      _ ->
        IO.puts("Could not create ./image directory")
    end
  end

  defp change_directory(filename) do 
    case File.rename(filename, "./images/#{filename}") do
      :ok ->
        IO.puts("#{filename} successfully moved to images directory")
      _ ->
        IO.puts("Error moving #{filename} to images directory")
    end
  end

  defp move_to_target(filename) do
    unless File.exists?("./images") do
      create_directory()
    end

    change_directory(filename)
  end

  defp matched_files(extensions) do 
    fn file -> 
      String.match?(file, extensions)
    end
  end

  def mv!() do
    extensions = ~r{[\/.](gif|jpg|jpeg|tiff|png)$}
    
    File.ls!()
    |> Enum.filter(matched_files(extensions))
    |> Enum.each(&move_to_target/1)
  end
end
