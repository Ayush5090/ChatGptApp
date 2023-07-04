import 'dart:convert';
import 'package:ai_app/utils/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAi {

  Future<String> gptApi(String prompt) async{

    final List<Map<String, String>> messages = [];

    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try{
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $gptApiKey'
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': messages,
        })
      );
      if(response.statusCode == 200){
        String content = jsonDecode(response.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch(e){
      return e.toString();
    }
  }
}