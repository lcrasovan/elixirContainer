
defmodule ApplicationOne do

  @message_one Application.get_env(:application_one, :message_one)
  @message_two Application.get_env(:application_one, :message_two)

  @default_list [1,2,3,4,5,6]

  def get_odd_numbers(list \\ @default_list) do
    Enum.filter(list, fn(x)-> rem(x,2) == 1 end)
  end

  def get_even_numbers(list \\ @default_list) do
    Enum.filter(list, fn(x)-> rem(x,2) == 0 end)
  end

  def show_messages do
    IO.puts "Message one is: #{@message_one}"
    IO.puts "Message two is: #{@message_two}"
  end
end
