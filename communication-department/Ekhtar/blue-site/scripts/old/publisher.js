var Control = {
  // start admin credentials
  admin_jid: 'admin@ekhtar.sy',
  admin_pass: 'ekhtar1a2s3d4f5g6h',
  // end admin credentials

  pubsub_server: 'pubsub.' + Config.XMPP_SERVER,
  multicast_server: 'multicast.' + Config.XMPP_SERVER,
  connection: null,
  connected: false,
  show_raw: true,
  show_log: true,

  // log to console if available
  log: function (msg) {
    if (Control.show_log && window.console) {
      console.log(msg);
    }
  },

  // simplify connection status messages
  feedback: function(msg, col) {
    $('#connection_status').html(msg).css('color', col);
  },

  // show the raw XMPP information coming in
  raw_input: function (data)  {
    if (Control.show_raw) {
      Control.log('RECV: ' + data);
    }
  },

  // show the raw XMPP information going out
  raw_output: function (data) {
    if (Control.show_raw) {
      Control.log('SENT: ' + data);
    }
  },

  // called when data is deemed as sent
  on_send: function (data) {
    Control.log("Data Sent");

    //add command to hbase
    var toElement=document.getElementById('toUsers');
    var messageElement=document.getElementById('message');
    var toUsers=toElement.value;
    var message=messageElement.value;
    var x = new XMLHttpRequest();
    x.open('GET','php/interface.php?op=addcommand&id='+(new Date()).getTime() +'&admin=su&users='+toUsers+'&text='+message+'',true);
    x.send();
    messageElement.value='';

    $('#message').val('');
    $('#progress').text('تم إرسال الرسالة').fadeIn().fadeOut(5000);


    return true;
  },

  // push the data to the clients
  publish: function (data) {
    if (data == '') return;

   
    var _d = data.toString();

    Control.connection.pubsub.publish(
      Control.admin_jid,
      Control.pubsub_server,
      Config.PUB_NODE,
      [_d],
      Control.on_send
    );
  },
  // send the msg to the clients
  sendMsg: function (data, toUsers) {
    if (data == '') return;
    var _d = data.toString();
    var message = $msg({to: Control.multicast_server, from: Control.admin_jid, type: 'chat', id: Date.now() + Math.random()})
            .cnode(Strophe.xmlElement("addresses", {xmlns: 'http://jabber.org/protocol/address'}));
    for (i = 0; i < toUsers.length; i++) {
      message.c("address", {type: 'to', jid: toUsers[i]+'@'+Config.XMPP_SERVER});
     message.up();
    }
    message.up().cnode(Strophe.xmlElement("body", {}, _d));
	  Control.connection.send(message.tree());
    Control.on_send(_d);
  },

  // initialiser
  init: function () {
    Control.connection.send($pres());
    var _p = $('#publish');
    _p.fadeIn();

    _p.click(function(event) {
      event.preventDefault();

      var to = $('#to').text().trim();
      var _data = $('textarea').val();
      if(!to)
        Control.publish(_data);
      else{
        var toUsers = to.split(' ');
        Control.sendMsg(_data, toUsers);
      }
    });

    return false;
  },

  // called when we have either created a node
  // or the one we're creating is available
  on_create_node: function (data) {
    Control.feedback('Connected', '#00FF00');
    Control.init();
  },
}

$(document).ready(function () {
  Control.log('Ready to go...');
  $(document).trigger('connect');
});

// this does the initial connection to the XMPP server
$(document).bind('connect', function () {
  var conn = new Strophe.Connection(Config.BOSH_SERVICE);
  Control.connection = conn;
  Control.connection.rawInput = Control.raw_input;
  Control.connection.rawOutput = Control.raw_output;
  Control.connection.addHandler(Control.on_result, null, "message", null, null);
  Control.connection.connect(
    Control.admin_jid, Control.admin_pass, function (status) {
      if (status == Strophe.Status.CONNECTING) {
        Control.log('Connecting...');
        Control.feedback('Connecting... (1 of 2)', '#009900');
      } else if (status == Strophe.Status.CONNFAIL) {
        Control.log('Failed to connect!');
        Control.feedback('Connection failed', '#FF0000');
      } else if (status == Strophe.Status.DISCONNECTING) {
        Control.log('Disconnecting...');
        Control.feedback('Disconnecting...', '#CC6600');
      } else if (status == Strophe.Status.DISCONNECTED) {
        Control.log('Disconnected');
        Control.feedback('Disconnected', '#aa0000');
        $(document).trigger('disconnected');
      } else if (status == Strophe.Status.CONNECTED) {
        $(document).trigger('connected');
      }
    }
  );
});

$(document).bind('connected', function () {
  Control.feedback('Connecting... (2 of 3)', '#00CC00');

  // first we make sure the pubsub node exists
  // buy trying to create it again
  Control.connection.pubsub.createNode(
    Control.admin_jid,
    Control.pubsub_server,
    Config.PUB_NODE,
    {},
    Control.on_create_node
  );
});

$(document).bind('disconnected', function () {
  Control.log('Disconnected, goodbye');
  Control.feedback('Disconnected', '#dd0000');
});
