// app/assets/javascripts/channels/requests.js

App.messages = App.cable.subscriptions.create('RequestsChannel', {
    received: function(data) {
        $("#requests")
        return $('#requests').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<tr> <td>" + data.url  + "</td> </tr>";;
    }
});