<%= form_for @profile do |f| %>

<div class="field">
<%= f.label :name %>
<%= f.text_field :name %>
</div>

<div class="actions">
<%= f.submit %>
</div>

<% end %>
