defmodule EulerWeb.RoomChannel do
  use Phoenix.Channel

  alias EulerWeb.Message

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    inserted = Message.process_message(body)
    broadcast!(socket, "new_msg", inserted)
    {:noreply, socket}
  end

  intercept ["user_joined"]

  def handle_out("user_joined", msg, socket) do
    push(socket, "user_joined", msg)
    {:noreply, socket}
  end

end
