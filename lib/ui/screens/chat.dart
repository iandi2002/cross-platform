import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Choose from the list of frequently asked questions.\nIf you have any remaining questions, please write your inquiry and we will contact you.',
            textAlign: TextAlign.center,
          ),
          _buildQuickButtons(),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          ChatInputWidget(
            onSendMessage: _handleSendMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () =>
                _handleQuickQuestion('Which cities does delivery cover?'),
            child: const Text('Delivery cities'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () =>
                _handleQuickQuestion('How long to wait for delivery?'),
            child: const Text('Delivery time'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () =>
                _handleQuickQuestion('How much does delivery cost?'),
            child: const Text('Delivery cost'),
          ),
        ],
      ),
    );
  }

  void _handleSendMessage(String messageText) {
    setState(() {
      _messages.add(ChatMessage(
        text: messageText,
        isBot: true,
      ));
    });
  }

  void _handleQuickQuestion(String question) {
    setState(() {
      if (question == 'Which cities does delivery cover?') {
        _messages.add(ChatMessage(
          text:
              'Delivery is carried out to all cities and remote villages of Kazakhstan.',
          isBot: true,
        ));
      } else if (question == 'How long to wait for delivery?') {
        _messages.add(ChatMessage(
          text:
              'Delivery time depends on the city and ranges from 1 to 14 days.',
          isBot: true,
        ));
      } else if (question == 'How much does delivery cost?') {
        _messages.add(ChatMessage(
          text:
              'The cost of delivery may vary depending on the city and order size. Approximate cost - from 500 to 2000 tenge.',
          isBot: true,
        ));
      }
    });
  }
}

class ChatInputWidget extends StatefulWidget {
  final Function(String) onSendMessage;
  const ChatInputWidget({Key? key, required this.onSendMessage})
      : super(key: key);

  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Type a message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final String messageText = _controller.text.trim();
              if (messageText.isNotEmpty) {
                widget.onSendMessage(messageText);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isBot;
  const ChatMessage({Key? key, required this.text, required this.isBot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isBot ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: isBot ? 16.0 : 0.0,
        right: isBot ? 0.0 : 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isBot
              ? Colors.blue.withOpacity(0.2)
              : Colors.green.withOpacity(0.2),
          borderRadius: isBot
              ? BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(0.0),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
