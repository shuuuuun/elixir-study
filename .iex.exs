# compile all .exs files
Path.wildcard("*.exs")
  |> Enum.each(&(c &1 ))
