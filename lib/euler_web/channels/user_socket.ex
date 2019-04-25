defmodule EulerWeb.UserSocket do
  use Phoenix.Socket
  require Logger

  ## Channels
  channel "room:*", EulerWeb.RoomChannel

  # Socket params are passed from the client and can
  # be used to verify and authenticate a user. After
  # verification, you can put default assigns into
  # the socket that will be set for all channels, ie
  #
  #     {:ok, assign(socket, :user_id, verified_user_id)}
  #
  # To deny connection, return `:error`.
  #
  # See `Phoenix.Token` documentation for examples in
  # performing token verification on connect.

  def ip_to_string(tuple), do: tuple |> Tuple.to_list |> Enum.join(".")
  def connect(_params, socket, _connect_info) do
    ip_address = ip_to_string(_connect_info[:peer_data][:address])
    Logger.info "ip_address #{inspect(ip_address)}"
    {:ok, socket}
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "user_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     EulerWeb.Endpoint.broadcast("user_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
