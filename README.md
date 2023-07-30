# Project Name: ChatGPT for Rails Related Questions

## Overview

ChatGPT for Rails Related Questions is a web application that utilizes OpenAI's GPT-3.5 language model to provide answers and assistance for Ruby on Rails related questions. This application aims to help Rails developers, beginners, and enthusiasts get quick and reliable answers to their questions and improve their understanding of Rails concepts.

## Features

- **User-friendly Interface**: The application provides an intuitive and easy-to-use interface for users to interact with ChatGPT.
- **Code Snippets**: When appropriate, ChatGPT can generate code snippets to demonstrate solutions to specific problems or implementations.
- **Anonymous Usage**: Users can interact with the system without the need for authentication or registration.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/team-153.git
```

2. Set up your OpenAI GPT-3.5 API access: https://beta.openai.com/signup/

3. Install the required gems:

```bash
bundle install
```

4. Set your OpenAI API key:
Create a .env file in the project root directory and add your API key:
```.env
OPENAI_API_KEY=your_openai_api_key_here
```

## Usage
1. On the application's home page, you will find a text input box.

2. Type your Rails-related question in the input box. For example, "How do I set up a one-to-many association in Rails?"

3. Press the "Ask" button to submit your question.

4. The application will send your question to the ChatGPT model via the OpenAI API and retrieve the response.

5. The response will be displayed on the screen, and if appropriate, it might include code snippets or examples.
   
6. If you are satisfied with the response, you can move forward with your development tasks. Otherwise, you can rephrase the question and ask again for a different response.

## Disclaimer
Please note that while ChatGPT strives to provide accurate and helpful information, it may not always be perfect. 
Always verify critical information from official documentation and trusted sources before implementing it in your projects.

## Contributing
We welcome contributions to improve this project. If you find bugs, have feature requests, or want to contribute 
in any way, feel free to open issues and submit pull requests on the GitHub repository.

## License
This project is open-source and available under the MIT License. Feel free to use, modify, 
and distribute it according to the terms of the license.