defmodule Greeter do 
  @author "Mark"

  defp say(@author), 
    do: "#{@author} is my favorite name in the world,"
    <> " i was programmed by #{@author}"
  defp say(name), 
    do: "Hi #{name}, nice to meet you"

  def start() do 
    name = 
      "Hi there, whats is your name?\n"
      |> IO.gets()
      |> String.trim()

    say(name)
  end
end
