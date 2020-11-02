module PasswordResetsHelper
  #1-2.4
  <%= provide(:title, "パスワード再設定") %>
    <%= form_for(:password_reset, url: password_resets_path) do |f| %>
      <%= f.label :email %>
      <%= f.email_field :email %>
      <%= f.submit "送信" %>
    <% end %>

end
