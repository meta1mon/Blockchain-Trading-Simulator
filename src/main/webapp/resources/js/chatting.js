const APP_ID = 'a2717810-5c0d-44d8-8295-6c4e6d7c52c2';
const DEMO_CHANNEL_ID = 'my_private_channel';


let client;
$(function(){
   reset();

     client = new TalkPlus.Client({appId: APP_ID});
     client.on('event', function (payload) {
       const parsedPayload = JSON.parse(payload);
       if (parsedPayload.type === 'message') {
         addMessage(parsedPayload.message);
       }
     });

     setupUsernameInputEventListener();
     sendMessageInputListener();
   
   
});



function hideUsernameWindow() {
  $('#username-window').hide();
}

function showChatWindow() {
  $('#main').show();
}

function setupUsernameInputEventListener() {
  $('#login-button').on('click', function () {
    const username = $('#username-input').val();
    if (!username) {
      return;
    }

    $('#username-input').val('');

    // login anonymously
    client.loginAnonymous({userId: username, username: username}, function (errResp, data) {
    	if (errResp.code === '1002') {
            alert("닉네임 조건을 확인해주세요");
           
         }

      // join demo channel
      client.joinChannel({channelId: DEMO_CHANNEL_ID}, function (errResp, data) {
        if (errResp) {
          if (errResp.code === '2003') { // if channel not found, create it
            client.createChannel({
              channelId: DEMO_CHANNEL_ID,
              name: DEMO_CHANNEL_ID,
              type: 'public',
              members: []
            }, function (errResp, data) {
              if (errResp) {
                return alert("4"+JSON.stringify(errResp));
              }
              hideUsernameWindow();
              showChatWindow();
            });
          } else if (errResp.code === '2008') { 
        	  
          } else {
            return null;

          }
        }

        client.getMessages({channelId: DEMO_CHANNEL_ID}, function (errResp, data) {
          if (errResp) {
            return null;

          }

          populateChatWindowWithMessages(data.messages);

          hideUsernameWindow();
          showChatWindow();
        });
      });
    });
  });
}

function sendMessageInputListener() {
  $('#enter').keypress((e) => {
    if (e.keyCode === 13) {
      const messageText = $('#enter').val();
      $('#enter').val('');

      addMessageText(messageText);
    }
  });
}

function populateChatWindowWithMessages(messages) {
  for (let i = messages.length - 1; i >= 0; i--) {
    const message = messages[i];
    $('#users').append($('<p></p>').text(message.userId));
    $('#messages').append($('<p></p>').text(message.text));
    $('#timestamps').append($('<p></p>').text(new Date(message.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false })));
  }
}

function addMessageText(messageText) {
  client.sendMessage({channelId: DEMO_CHANNEL_ID, type: 'text', text: messageText}, function (err, data) {
    if (err) {
      return null;
    }

    $('#users').append($('<p></p>').text(data.message.userId));
    $('#messages').append($('<p></p>').text(messageText));
    $('#timestamps').append($('<p></p>').text(new Date(data.message.createdAt).toLocaleTimeString()));
  });
}

function addMessage(messageObj) {
  $('#users').append($('<p></p>').text(messageObj.userId));
  $('#messages').append($('<p></p>').text(messageObj.text));
  $('#timestamps').append($('<p></p>').text(new Date(messageObj.createdAt).toLocaleTimeString()));
}

function reset() {
  $('#username-input').val('');
}