
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


  def variable_context do
    content = "This is a sample text"

    lp = with {:ok, file}    = File.open("/etc/passwd"),
               content       = IO.read(file, :line),
               :ok           = File.close(file),
               [_, uid, gid] = Regex.run(~r/lp:.*?:(\d+):(\d+)/, content)
         do
           "Group: #{gid}, User: #{uid}"
         end

    IO.puts lp
    IO.puts content
  end

  def calculate_mean_value(list \\ [1, 2, 3, 4, 5, 6.0, 7.1]) do
    with count = Enum.count(list),
         sum = Enum.sum(list)
    do
      sum/count
    end
  end

end
