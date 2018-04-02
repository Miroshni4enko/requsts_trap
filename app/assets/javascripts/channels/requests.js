// app/assets/javascripts/channels/requests.js

App.messages = App.cable.subscriptions.create('RequestsChannel', {
    received: function(data) {
        $("#requests")
        return $('#requests').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<a class=\"list-group-item\">"+
            "<h4 class=\"list-group-item-heading\">Creation Date</h4>"+
        "<p class=\"list-group-item-text\">"+ data.request.creation_date +"</p>"+

            "<h4 class=\"list-group-item-heading\">Remote Ip</h4>"+
        "<p class=\"list-group-item-text\">"+ data.request.creation_date +"</p>"+

            "<h4 class=\"list-group-item-heading\">Headers</h4>"+
            "<p class=\"list-group-item-text trancate-long-string\">" + data.request.headers + "</p>"+

            "<h4 class=\"list-group-item-heading\">Cookies</h4>"+
            "<p class=\"list-group-item-text trancate-long-string\">"+ data.request.cookies +"</p>"+

            "<h4 class=\"list-group-item-heading\">Query-params</h4>"+
            "<p class=\"list-group-item-text trancate-long-string\">" + data.request.query-params + "</p>"+

            "<h4 class=\"list-group-item-heading\">Query-string</h4>" +
            "<p class=\"list-group-item-text trancate-long-string\">" + data.request.query-string +"</p>"+

            "<h4 class=\"list-group-item-heading\">Query-params</h4>"+
            "<p class=\"list-group-item-text trancate-long-string\">" + data.request.query-params +"</p>"+

            "<h4 class=\"list-group-item-heading\">Scheme</h4>"+
            "<p class=\"list-group-item-text trancate-long-string\">" + data.request.scheme +"</p>"+
        "</a>";
    }
});