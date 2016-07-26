
defmodule ApplicationOne do

  @message_one Application.get_env(:application_one, :message_one)
  @message_two Application.get_env(:application_one, :message_two)

  def show_messages do
    IO.puts "Message one is: #{@message_one}"
    IO.puts "Message two is: #{@message_two}"
  end
end
