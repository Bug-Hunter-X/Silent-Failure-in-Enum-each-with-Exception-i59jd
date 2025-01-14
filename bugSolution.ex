```elixir
list = [1, 2, 3, 4, 5]

result = Enum.map(list, fn x ->
  try
    if x == 3 do
      #Simulate a potential failure
      :erlang.throw(:error)
      #Process.sleep(1000) # Simulate a long-running operation
    end
    {:ok, x}
  catch
    :error -> {:error, x}
    _ -> {:error, x} 
  end
end)

IO.inspect result

#Process the results
Enum.each(result, fn
  {:ok, x} -> IO.puts("Processed: #{x}")
  {:error, x} -> IO.puts("Error processing: #{x}")
end)
```