P2P Chat Application

When you send a message to a person, the message is stored on your server as "outgoing message to B"
1. If that person is online and receives the message, the person responds confirming that he has sent it. The receiver stores the message on his file. The sender deletes "outgoing message to B".
2. If that person is not online, nothing.

When you login, you ping every friend for messages you have missed.
1. If a person is online, you get all of the messages you have missed from that person. If you had messages to send to that person, you send them as well. Record that you have checked on that person.
2. If a person is not online, nothing happens.

ON YOUR COMPUTER

For every friend, there are 2 files: Message Log File, and Out Backlog File.

Data format:

HEADER, MESSAGE #, MESSAGE, TIMESTAMP

To send from A to B, A encrypts with the AB shared key. A sends to everyone. B receives a message, B tries every shared key to decrypt it, only one will have correct header. If none of the keys work, discard
the message.

Daemon thread types:
1. Sending messages (1 per recepient), encryption
2. Main thread: creates the send/receive threads as needed
3. Thread handling when a message is received (1 per message), decryption
