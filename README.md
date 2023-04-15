# Open Access GPT

Open Access GPT is an open-source, unofficial ChatGPT app with extra features and more ways to customize your experience.

Powered by the new ChatGPT API from OpenAI, this app is a customized fork of the [Cogent Apps](https://github.com/cogentapps/chat-with-gpt) one. We welcome pull requests from the community!

## Features

-   🚀 **Fast** response times.
-   🔎 **Search** through your past chat conversations.
-   📄 View and customize the System Prompt - the **secret prompt** the system shows the AI before your messages.
-   🌡 Adjust the **creativity and randomness** of responses by setting the Temperature setting. Higher temperature means more creativity.
-   💬 Give ChatGPT AI a **realistic human voice** by connecting your ElevenLabs text-to-speech account.
-   🎤 **Speech recognition** powered by OpenAI Whisper.
-   ✉ **Share** your favorite chat sessions online using public share URLs.
-   📋 Easily **copy-and-paste** ChatGPT messages.
-   ✏️ Edit your messages
-   🔁 Regenerate ChatGPT messages
-   🖼 **Full markdown support** including code, tables, and math.
-   🫰 Pay for only what you use with the ChatGPT API.

## Bring your own API keys

### OpenAI

To get started with Open Access GPT, you will need to add your OpenAI API key on the settings screen. Click "Connect your OpenAI account to get started" on the home page to begin. Once you have added your API key, you can start chatting with ChatGPT.

Your API key is stored only on your device and is never transmitted to anyone except OpenAI. Please note that OpenAI API key usage is billed at a pay-as-you-go rate, separate from your ChatGPT subscription.

### ElevenLabs

To use the realistic AI text-to-speech feature, you will need to add your ElevenLabs API key by clicking "Play" next to any message.

Your API key is stored only on your device and never transmitted to anyone except ElevenLabs.

## Run locally

1. Clone the repository in your local computer.
2. Download from the [Node.js](https://nodejs.org/en) website the installer for your operating system and proceed installing  Node.js 18.15.0 and npm.
3. Navigate to the `app` folder of the repository and execute the command `npm install`.
4. Start the app via the command `npm start`. The web app will be available on [http://localhost:3000](http://localhost:3000).

## Run Locally with Kubernets ( Kind ) cluster ( linux only )
1. Clone the repository in your local computer.
2. Install tilt, ctlptl and kind 
> https://docs.tilt.dev/install.html
> https://github.com/tilt-dev/ctlptl/blob/main/INSTALL.md
> https://kind.sigs.k8s.io/docs/user/quick-start/

3. Run `setup.sh` script
  - when you see the following
    ```
      Tilt started on http://localhost:10350/
    v0.30.12, built 2022-11-16

    (space) to open the browser
    (s) to stream logs (--stream=true)
    (t) to open legacy terminal mode (--legacy=true)
    (ctrl-c) to exit
    ```

    you can press the space bar and the Tilt UI will open in your browser at localhost:10350,
    there, you'll be able to see the deployment progress of openaccessgpt code.
    [Tilt](doc/tilt.png)
  - Once you've done coding,if you press Ctrl-C, the script will delete the cluster and
  	cleanup all resources.
  	It will also ask if you want to remove all images built available on your machine.

4. Once the deployment is completed you'll be able to reach OpenAccessGPT at
> https://local-dev.duckdns.org ( which actually points to localhost)
[OAG](doc/openaccessgpt.png)

## License

Open Access GPT is licensed under the MIT license. See the LICENSE file for more information.
