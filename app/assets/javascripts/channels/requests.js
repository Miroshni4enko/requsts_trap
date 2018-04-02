// app/assets/javascripts/channels/requests.js

App.messages = App.cable.subscriptions.create('RequestsChannel', {
    received: function(data) {
        $("#requests")
        return $('#requests').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<a class=\"list-group-item\">" +
                  "<h4 class=\"list-group-item-heading\">URL</h4>" +
                  "<p class=\"list-group-item-text\">"+ data.url +"</p> </a>";
    }
});